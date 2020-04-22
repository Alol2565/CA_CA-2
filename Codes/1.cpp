#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main()
{

    string inst;
    for (int i = 0; i < 31; i++)
    {
        inst += "0" ;
    }
    string s1 = inst;
    s1 += "1";
    inst += "0";
    fstream input;
    input.open("mem.data",fstream::out);
    for(int i = 0; i < 16384 ;i++)
    {
        if (i == 1000)
        {
            for ( int j = 0; j < 20 ; j++)
            {
                input <<  s1 << endl ;
            }    
            i = i + 20;
            continue;
        }
        
        input <<inst << endl ;
    }
    input.close();
}