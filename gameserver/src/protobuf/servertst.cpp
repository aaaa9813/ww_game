#include "servertst.h"

std::map<ww::MSG_TYPE, BaseHandler *> BaseHandler::handers;
void BaseHandler::Register( BaseHandler * h )
{
    handers[h->GetType()] = h;
}
void BaseHandler::Execute( const ww::ServerMsg * msg)
{
    std::map<ww::MSG_TYPE, BaseHandler *>::iterator it = handers.find(msg->msg_type());
    if( it != handers.end ())
    {
        it->second->Process(msg);
    }else{
        printf("消息[%d]没有对应的处理方法.\n",msg->msg_type());
    }
}


template<>
void MessageHandler<ww::MSG_ENTER_GAME>::Process(const ww::ServerMsg * msg)
{
	printf("user enter game\n");
}
template<>
MessageHandler<ww::MSG_ENTER_GAME> MessageHandler<ww::MSG_ENTER_GAME>::thisHandler;

MessageHandler<ww::MSG_ENTER_GAME> handle;


/*
//对每个MSG 枚举的消息值，都会特化一个Process方法。
template<>
void MessageHandler<pbmsg::Login_Request>::Process( const shared_ptr<pbmsg::Message> & msg , ...其它参数){}
//并且在全局空间创建对象，系统启动时，自动创建。如果需要在堆空间中分配，另行封装方法，并调用下面的代码，让编译器实例化类。
MessageHandler<pbmsg::Login_Request> MessageHandler<pbmsg::Login_Request>::thisHandler;
// 最后消息处理：非常的easy：shared_ptr<pbmsg::Message> recvMessage( new pbmsg::Message());
bool parserOk = recvMessage->ParseFromArray((msg.rd_ptr ()+4), msg.size ()-4);
if( parserOk ){

    BaseHandler::Execute (recvMessage, ...其它参数);
  
 }

*/
