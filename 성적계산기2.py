#성적계산기

class Score:
    def __init__(self):
        self.korean =eval(input("국어성적은 몇점인가요?"))
        self.math =eval(input("수학성적은 몇점인가요?"))
        self.english =eval(input("영어성적은 몇 점인가요?"))
    
    def assesment(self):
        result= self.korean+self.math+self.english
        if(self.korean <60):
            print("당신은 국어에서 과락입니다.")
        if(self.math < 60):
            print("당신은 수학에서 과락입니다.")
        if(self.english <60):
            print("당신은 영어에서 과락입니다.")
        if(result <270):
            print("당신은 총점에서 과락입니다.")

    def file_input(self,name,korean,math,english):
        f =open("%s의 성적"%self.name,'w') 
        data = ("국어 : %d ,수학 : %d, 영어 : %d")%(korean,math,english)
        f.write(data)
        f.close()

name = input("당신의 이름은?")
num = input("당신의 학번은?")
a=Score()
a.name = name
a.assesment()
a.file_input(name,a.korean,a.math,a.english)
