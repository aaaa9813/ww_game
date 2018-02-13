/*
 * CDDZGame.h
 *
 *  Created on: 2017年4月11日
 *      Author: aaaa
 */

#ifndef CDDZGAME_H_
#define CDDZGAME_H_

#include "../Base/CBaseGame.h"

class CPlayer;

//struct SDDZPai
//{
//	int id;
//	int value;
//	int num;
//	int type;
//
//	SDDZPai * operator = ( SDDZPai * pCard )
//	{
//		this->id	= pCard->id;
//		this->value = pCard->value;
//		this->num	= pCard->num;
//		this->type	= pCard->type;
//
//		return this;
//	}
//};
enum DDZ_PAI_TYPE {
	PAI_TYPE_NONE,
	PAI_TYPE_ROCKET,
	PAI_TYPE_BOMB,
	PAI_TYPE_DANSHUN,
	PAI_TYPE_SHUANGSHUN,
	PAI_TYPE_SANSHUN,
	PAI_TYPE_SANDAIYISINGLE,
	PAI_TYPE_SANDAIYIDOUBLE,
	PAI_TYPE_PLANESINGLE,
	PAI_TYPE_PLANEDOUBLE,
	PAI_TYPE_SIDAIERSINGLE,
	PAI_TYPE_SIDAIERDOUBLE,
	PAI_TYPE_THREE,
	PAI_TYPE_DOUBLE,
	PAI_TYPE_SINGLE,
};
struct SDDZUser {

	SDDZUser() {
		m_bIsDiZhu = false;
		m_iJiaoFen = -1;
		m_wPaiNum = 17;
		m_iChuPaiNum = 0;

		memset(m_wPai, 0, sizeof(int) * 20);
	}
	unsigned int Uid;
	int m_wPai[20];					//玩家手里的牌
	int m_wPaiNum;					//牌的数量

	int m_DaPai[20];				//玩家出的牌
	int m_wDaPaiNum;				//出牌数量

	bool m_bIsDiZhu;				//是否地主
	int m_iJiaoFen;					//叫牌（-1,没叫过牌　　0,不叫　　　1,叫１分　　　2,叫２分　　　3,叫３分）

	double m_dCountScore;			//总成绩

	int m_iChuPaiNum;				//出牌次数

};

class CDDZGame: public CBaseGame {
public:

	bool ProHostMsgByStream(unsigned int uid, unsigned char * data,
			unsigned int len);

	CDDZGame();
	virtual ~CDDZGame();
	bool Net_Ready(unsigned int uid);

	virtual bool EnterGame(unsigned int uid, unsigned int &index);

	virtual bool LeaveGame(unsigned int uid) {
	}
	;

public:

	void ChuPai(CPlayer * pUser, unsigned int pai[], unsigned int len);

	void PassPai(CPlayer * pUser);

	void JiaoPai(CPlayer * pUser, int num);

	void StartGame();

	void SetDiZhu(CPlayer * pUser, int num);


protected:
	void Reset();

	void Shuffle();

	void MoveCurPointer();

	void SortCard(SDDZPai Card[], int num);
	// 出牌检测
	bool ChuPaiCheck(CPlayer * pUser, unsigned int pai[], int num);
	// 检测是否为火箭牌型
	bool _IsRocket(SDDZPai pai[], int num);
	// 检测是否为炸弹牌型
	int _IsBomb(SDDZPai pai[], int num);
	// 检测是否为单顺牌型
	int _IsDanShun(SDDZPai pai[], int num);
	// 检测是否为双顺牌型
	int _IsShuangShun(SDDZPai pai[], int num);
	// 检测是否为三顺牌型
	int _IsSanShun(SDDZPai pai[], int num);
	// 检测是否为三带一牌型(单张)
	int _IsSanDaiYiSingle(SDDZPai pai[], int num);
	// 检测是否为三带一牌型(对儿)
	int _IsSanDaiYiDouble(SDDZPai pai[], int num);
	// 检测是否为飞机带翅膀牌型(单张)
	int _IsPlaneSingle(SDDZPai pia[], int num);
	// 检测是否为飞机带翅膀牌型(对儿)
	int _IsPlaneDouble(SDDZPai pia[], int num);
	// 检测是否为四带二牌型(单张)
	int _IsSiDaiErSingle(SDDZPai pai[], int num);
	// 检测是否为四带二牌型(对儿)
	int _IsSiDaiErDouble(SDDZPai pai[], int num);
	// 检测是否为对儿
	int _Is2(SDDZPai pai[], int num);
	// 栓测是否为三张牌
	int _Is3(SDDZPai pai[], int num);
	// 检测牌的类型
	int CheckPaiType(SDDZPai pai[], int num, int &PaiSize);
	// 获得相同牌的个数
	int GetCardCountByCardNum(SDDZPai pai[], int num, int PaiNum);

	bool HaveTheCard(CPlayer * pUser, int pai);

	void MoveAbandonCardToArrayLast( CPlayer * pUser, unsigned int AbandonPai[], int AbandonNum );
	void WinBalance( bool bIsDiZhu );
	bool GameEnd();
	void ResetTablePai();

	int GetActIndex();
public:

	CBaseUser ** m_pUsers;
	int m_iNext;					//下张牌
	int m_iLast;					//最后张牌

	int m_iDiZhu;					//地主
	int m_iDiPai[3];				//三张底牌
	int m_iPai[54];
	SDDZUser m_UserInfo[3];

	int m_iNumOfBomb;				//炸弹的数量
	int m_iNumOfRocket;				//火箭的数量,最多１个
	int m_iChunTianOrFanChun;		//春天或反春,最多１个

	int m_iCurTabPai[20];			//当前桌面上已出的牌型
	int m_iTabPaiNum;

	int m_iChuPaiUser;				//出牌人（座位号）

	int m_iPassCount;				//连续过牌次数

	bool m_bHasDiZhu;				//true 已有地主
	int m_iCurJiaoFen;				//当前叫的分

	bool m_bInGame;					//true gaming




protected:


	unsigned int m_nCurUser;									//当前活动玩家

	unsigned int m_nTime;										//记时

//	CBaseRoom * m_pRoom;										//属于哪个房间

	int m_iBout;										//第几局

	int m_nActUid;
};
extern SDDZPai g_DDZPaiInfo[54];
extern SDDZPai * GetDDZPaiInfo(int wId);
#endif /* CDDZGAME_H_ */
