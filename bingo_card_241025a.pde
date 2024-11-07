//BINGO参加者カード
//5*5のマス目にランダムな数字を表示する
/*生成したカードのパターンには重複しない番号を付け、同じパターンがでないようにする。
　→ハッシュ関数を使う。チェックサムで一致を調べられる。
　ハッシュ関数：ある文字列を固定長の異なる文字列に変換する。
　文字列中で、文字または並びが少しでも異なると出力される値は必ず異なる
　パスワード管理で用いられるハッシュ関数は逆方向の変換ができなくしてある
　代表的なアルゴリズム：MD5（まれに同じものがでる）
　データが異なるか同一であるかのチェックに用いられる
　ファイルの同一性チェックにも用いられる*/
//マス目をタッチして数字を選択できるようにする
//選択した数字の並びをチェックしてリーチまたはビンゴを判定する

import controlP5.*;

ControlP5 cp5;
Button Btn00,Btn01,Btn02,Btn03,Btn04,
Btn10,Btn11,Btn12,Btn13,Btn14,
Btn20,Btn21,BtnCenter,Btn23,Btn24,
Btn30,Btn31,Btn32,Btn33,Btn34,
Btn40,Btn41,Btn42,Btn43,Btn44;
Textarea textarea;

  boolean [][] select={{false,false,false,false,false,},{false,false,false,false,false},
  {false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false}};
int count;

int[][] number=new int[5][5];
int[] num=new int[75];
String check0,check1,check2,check3,check4;


void setup(){
  size(800,600);
  cp5=new ControlP5(this);
  PFont font=createFont("arial",30);
  textFont(font);
  select[2][2]=true;
  
  for(int i=0;i<75;i++){
  num[i]=i+1; //配列numに1～75の数字を入れる
  }
  
  for(int i=0;i<15;i++){ //0～14番目の数字をシャッフル
    int rnd=(int)(random(0,14));
    int w=num[i];
    num[i]=num[rnd];
    num[rnd]=w;
  }
  for(int i=0;i<5;i++){
    number[i][0]=num[i];
    check0=check0+str(num[i]);
  }
  
  for(int i=16;i<30;i++){
    int rnd=(int)(random(16,29));
    int w=num[i];
    num[i]=num[rnd];
    num[rnd]=w;
  }
  for(int i=0;i<5;i++){
    number[i][1]=num[i+16];
    check1=check1+str(num[i+16]);
  }
  
  for(int i=31;i<45;i++){
    int rnd=(int)(random(31,44));
    int w=num[i];
    num[i]=num[rnd];
    num[rnd]=w;
  }
  for(int i=0;i<5;i++){
    number[i][2]=num[i+31];
    check2=check2+str(num[i+31]);
  }
  
  for(int i=46;i<60;i++){
    int rnd=(int)(random(46,59));
    int w=num[i];
    num[i]=num[rnd];
    num[rnd]=w;
  }
  for(int i=0;i<5;i++){
    number[i][3]=num[i+46];
    check3=check3+str(num[i+46]);
  }
  
  for(int i=61;i<75;i++){
    int rnd=(int)(random(61,74));
    int w=num[i];
    num[i]=num[rnd];
    num[rnd]=w;
  }
  for(int i=0;i<5;i++){
    number[i][4]=num[i+61];
    check4=check4+str(num[i+61]);
  }
  
  //String hexCheck0=DigestUtils.md5Hex(check0);
  

  Btn00=cp5.addButton(str(number[0][0]));
  Btn00.setPosition(20,20);
  Btn00.setSize(80,70);
  Btn00.setFont(font);
  Btn00.setId(10);
  Btn00.setColorForeground(color(255,255,255));
  
  Btn01=cp5.addButton(str(number[0][1]));
  Btn01.setPosition(100,20);
  Btn01.setSize(80,70);
  Btn01.setFont(font);
  Btn01.setId(20);
  Btn01.setColorForeground(color(255,255,255));
  
  Btn02=cp5.addButton(str(number[0][2]));
  Btn02.setPosition(180,20);
  Btn02.setSize(80,70);
  Btn02.setFont(font);
  Btn02.setId(30);
  Btn02.setColorForeground(color(255,255,255));
  
  Btn03=cp5.addButton(str(number[0][3]));
  Btn03.setPosition(260,20);
  Btn03.setSize(80,70);
  Btn03.setFont(font);
  Btn03.setId(40);
  Btn03.setColorForeground(color(255,255,255));
  
  Btn04=cp5.addButton(str(number[0][4]));
  Btn04.setPosition(340,20);
  Btn04.setSize(80,70);
  Btn04.setFont(font);
  Btn04.setId(50);
  Btn04.setColorForeground(color(255,255,255));
  
  Btn10=cp5.addButton(str(number[1][0]));
  Btn10.setPosition(20,90);
  Btn10.setSize(80,70);
  Btn10.setFont(font);
  Btn10.setId(60);
  Btn10.setColorForeground(color(255,255,255));
  
  Btn11=cp5.addButton(str(number[1][1]));
  Btn11.setPosition(100,90);
  Btn11.setSize(80,70);
  Btn11.setFont(font);
  Btn11.setId(70);
  Btn11.setColorForeground(color(255,255,255));
  
  Btn12=cp5.addButton(str(number[1][2]));
  Btn12.setPosition(180,90);
  Btn12.setSize(80,70);
  Btn12.setFont(font);
  Btn12.setId(80);
  Btn12.setColorForeground(color(255,255,255));
  
  Btn13=cp5.addButton(str(number[1][3]));
  Btn13.setPosition(260,90);
  Btn13.setSize(80,70);
  Btn13.setFont(font);
  Btn13.setId(90);
  Btn13.setColorForeground(color(255,255,255));
  
  Btn14=cp5.addButton(str(number[1][4]));
  Btn14.setPosition(340,90);
  Btn14.setSize(80,70);
  Btn14.setFont(font);
  Btn14.setId(100);
  Btn14.setColorForeground(color(255,255,255));
  
  Btn20=cp5.addButton(str(number[2][0]));
  Btn20.setPosition(20,160);
  Btn20.setSize(80,70);
  Btn20.setFont(font);
  Btn20.setId(110);
  Btn20.setColorForeground(color(255,255,255));
  
  Btn21=cp5.addButton(str(number[2][1]));
  Btn21.setPosition(100,160);
  Btn21.setSize(80,70);
  Btn21.setFont(font);
  Btn21.setId(120);
  Btn21.setColorForeground(color(255,255,255));
  
  BtnCenter=cp5.addButton("*");
  BtnCenter.setPosition(180,160);
  BtnCenter.setSize(80,70);
  BtnCenter.setFont(font);
  BtnCenter.setId(130);

  Btn23=cp5.addButton(str(number[2][3]));
  Btn23.setPosition(260,160);
  Btn23.setSize(80,70);
  Btn23.setFont(font);
  Btn23.setId(140);
  Btn23.setColorForeground(color(255,255,255));

  Btn24=cp5.addButton(str(number[2][4]));
  Btn24.setPosition(340,160);
  Btn24.setSize(80,70);
  Btn24.setFont(font);
  Btn24.setId(150);
  Btn24.setColorForeground(color(255,255,255));

  Btn30=cp5.addButton(str(number[3][0]));
  Btn30.setPosition(20,230);
  Btn30.setSize(80,70);
  Btn30.setFont(font);
  Btn30.setId(160);
  Btn30.setColorForeground(color(255,255,255));

  Btn31=cp5.addButton(str(number[3][1]));
  Btn31.setPosition(100,230);
  Btn31.setSize(80,70);
  Btn31.setFont(font);
  Btn31.setId(170);
  Btn31.setColorForeground(color(255,255,255));

  Btn32=cp5.addButton(str(number[3][2]));
  Btn32.setPosition(180,230);
  Btn32.setSize(80,70);
  Btn32.setFont(font);
  Btn32.setId(180);
  Btn32.setColorForeground(color(255,255,255));

  Btn33=cp5.addButton(str(number[3][3]));
  Btn33.setPosition(260,230);
  Btn33.setSize(80,70);
  Btn33.setFont(font);
  Btn33.setId(190);
  Btn33.setColorForeground(color(255,255,255));

  Btn34=cp5.addButton(str(number[3][4]));
  Btn34.setPosition(340,230);
  Btn34.setSize(80,70);
  Btn34.setFont(font);
  Btn34.setId(200);
  Btn34.setColorForeground(color(255,255,255));

  Btn40=cp5.addButton(str(number[4][0]));
  Btn40.setPosition(20,300);
  Btn40.setSize(80,70);
  Btn40.setFont(font);
  Btn40.setId(210);
  Btn40.setColorForeground(color(255,255,255));

  Btn41=cp5.addButton(str(number[4][1]));
  Btn41.setPosition(100,300);
  Btn41.setSize(80,70);
  Btn41.setFont(font);
  Btn41.setId(220);
  Btn41.setColorForeground(color(255,255,255));

  Btn42=cp5.addButton(str(number[4][2]));
  Btn42.setPosition(180,300);
  Btn42.setSize(80,70);
  Btn42.setFont(font);
  Btn42.setId(230);
  Btn42.setColorForeground(color(255,255,255));

  Btn43=cp5.addButton(str(number[4][3]));
  Btn43.setPosition(260,300);
  Btn43.setSize(80,70);
  Btn43.setFont(font);
  Btn43.setId(240);
  Btn43.setColorForeground(color(255,255,255));

  Btn44=cp5.addButton(str(number[4][4]));
  Btn44.setPosition(340,300);
  Btn44.setSize(80,70);
  Btn44.setFont(font);
  Btn44.setId(250);
  Btn44.setColorForeground(color(255,255,255));
  
  textarea=cp5.addTextarea("hyouji");
  textarea.setPosition(100,450);
  textarea.setSize(300,100);
  textarea.setColorBackground(color(0,0,0));
  textarea.setColorForeground(color(255,255,255));
  textarea.setFont(font);
}

void draw(){
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.getId() == 10) {
    Btn00.setColorBackground(color(240,240,240));
    select[0][0]=true;
  }else if(theEvent.getId() == 20){
    Btn01.setColorBackground(color(240,240,240));
    select[0][1]=true;
  }else if(theEvent.getId() == 30){
    Btn02.setColorBackground(color(240,240,240));
    select[0][2]=true;
  }else if(theEvent.getId() == 40){
    Btn03.setColorBackground(color(240,240,240));
    select[0][3]=true;
  }else if(theEvent.getId() == 50){
    Btn04.setColorBackground(color(240,240,240));
    select[0][4]=true;
  }else if(theEvent.getId() == 60){
    Btn10.setColorBackground(color(240,240,240));
    select[1][0]=true;
  }else if(theEvent.getId() == 70){
    Btn11.setColorBackground(color(240,240,240));
    select[1][1]=true;
  }else if(theEvent.getId() == 80){
    Btn12.setColorBackground(color(240,240,240));
    select[1][2]=true;
  }else if(theEvent.getId() == 90){
    Btn13.setColorBackground(color(240,240,240));
    select[1][3]=true;
  }else if(theEvent.getId() == 100){
    Btn14.setColorBackground(color(240,240,240));
    select[1][4]=true;
  }else if(theEvent.getId() == 110){
    Btn20.setColorBackground(color(240,240,240));
    select[2][0]=true;
  }else if(theEvent.getId() == 120){
    Btn21.setColorBackground(color(240,240,240));
    select[2][1]=true;
  }else if(theEvent.getId() == 140){
    Btn23.setColorBackground(color(240,240,240));
    select[2][3]=true;
  }else if(theEvent.getId() == 150){
    Btn24.setColorBackground(color(240,240,240));
    select[2][4]=true;
  }else if(theEvent.getId() == 160){
    Btn30.setColorBackground(color(240,240,240));
    select[3][0]=true;
  }else if(theEvent.getId() == 170){
    Btn31.setColorBackground(color(240,240,240));
    select[3][1]=true;
  }else if(theEvent.getId() == 180){
    Btn32.setColorBackground(color(240,240,240));
    select[3][2]=true;
  }else if(theEvent.getId() == 190){
    Btn33.setColorBackground(color(240,240,240));
    select[3][3]=true;
  }else if(theEvent.getId() == 200){
    Btn34.setColorBackground(color(240,240,240));
    select[3][4]=true;
  }else if(theEvent.getId() == 210){
    Btn40.setColorBackground(color(240,240,240));
    select[4][0]=true;
  }else if(theEvent.getId() == 220){
    Btn41.setColorBackground(color(240,240,240));
    select[4][1]=true;
  }else if(theEvent.getId() == 230){
    Btn42.setColorBackground(color(240,240,240));
    select[4][2]=true;
  }else if(theEvent.getId() == 240){
    Btn43.setColorBackground(color(240,240,240));
    select[4][3]=true;
  }else if(theEvent.getId() == 250){
    Btn44.setColorBackground(color(240,240,240));
    select[4][4]=true;
  }
}
