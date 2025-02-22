module metaschool::calculator_l05
{
    use std::string::{String,utf8};
    use std::signer;

    struct Message has key
    {
        my_message : String
    }

    public entry fun create_message(account: &signer) acquires Message {
        
        let my_message = utf8(b"I am a Calculator dApp");

        if (exists<Message>(signer::0x1262810a816be93426e1d8848065ef3f490bca8a26b0a9f065ec796171b8abca)){
            let message = borrow_global_mut<Message>(signer::0x1262810a816be93426e1d8848065ef3f490bca8a26b0a9f065ec796171b8abca);
            message.my_message = my_message;
        }
        else {
            let message = Message {
                my_message : my_message            
            };
            move_to(account,message);    
        }
    }

    public fun get_message(account: &signer): String acquires Message {
        let calculator = borrow_global<Message>(signer::0x1262810a816be93426e1d8848065ef3f490bca8a26b0a9f065ec796171b8abca);
        calculator.my_message
    }
}
