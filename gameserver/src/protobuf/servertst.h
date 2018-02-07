#pragma once
#include "server_msg.pb.h"
#include <memory>
#include <map>


class BaseHandler
{
public:
    BaseHandler(ww::MSG_TYPE type):type_(type){
        Register (this);
    }
    virtual ~BaseHandler(){}

    ww::MSG_TYPE GetType() const { return type_; }
	//具体处理方法，由派生类实现.
    virtual void Process( const ww::ServerMsg * msg) = 0;

	//注册消息处理方法
    static void Register( BaseHandler *);
	//执行指定的消息,查询处理方法，调用Process。
    static void Execute( const ww::ServerMsg * msg);
private:
    ww::MSG_TYPE type_;
    
   
private:
    static std::map<ww::MSG_TYPE, BaseHandler *> handers;
};
// 每个消息都实现Process的一个特化版本...
template< ww::MSG_TYPE Type>
class MessageHandler : public BaseHandler
{
public:
    MessageHandler(void):BaseHandler(Type){}
    ~MessageHandler(void){}

    void Process( const ww::ServerMsg * msg);
private:
    static MessageHandler thisHandler;
   
};

