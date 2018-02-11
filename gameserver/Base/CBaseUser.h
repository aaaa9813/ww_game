#ifndef CBaseUser_H_
#define CBaseUser_H_
#include "CBase.h"
class CBaseUser:public CBase
{
	public:
		CBaseUser();
		~CBaseUser();


	public:
		int 		m_iChairId;

		bool		 m_bReady;

	public:

		///true, off-line; false, on-line
		bool 		m_bDrop;

		unsigned int GetIndex()
		{
			return m_iChairId;
		}

		void SetIndex(unsigned int index)
		{
			m_iChairId = index;
		}

		bool GetReady()
		{
			return m_bReady;
		}

		void SetReady(bool b)
		{
			m_bReady = b;
		}

		unsigned int m_iState;

		unsigned long long m_lHappyBean;
		unsigned long long m_lMoney;

		unsigned int m_iMatchScore;
};
#endif
