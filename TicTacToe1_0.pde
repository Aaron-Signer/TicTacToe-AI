int [][] board = new int [3][3];

void printBoard()
{
  println("--------");
  for(int r = 0; r < 3;r++)
  {
    for(int c = 0; c < 3;c++)
    {
      if(board[r][c] == 1)
      print("X ");
      if(board[r][c] == -1)
      print("O ");
      if(board[r][c] == 0)
      print("  ");
    }
    println();
  }
}

int whoWon(int ply)
{
  int sum;
  for(int i = 0; i < 3;i++)
  {
    sum = board[i][0] + board[i][1] + board[i][2];
    if(sum == 3)
      return 100-ply;
    if( sum == -3)
      return  -100;
 
    sum = board[0][i] + board[1][i] + board[2][i];
    if(sum == 3)
      return 100 - ply;
    if(sum == -3)
      return  -100;
  }
  
    sum = board[0][0] + board[1][1] + board[2][2];
    if(sum == 3)
      return 100;
    if(sum == -3)
      return  -100;
      
    sum = board[2][0] + board[1][1] + board[0][2];
    if(sum == 3)
      return 100;
    if(sum == -3)
      return  -100;
  
    sum = 0;
  
    for(int i = 0; i < 9; i++)
    {
      if(board[i/3][i%3] == 1)
      sum +=i;
    }
  
    return sum;
}

int miniMax(int curPlayer, int ply)
{
  int score, bestScore, pos = 0, gameState = whoWon(ply);
  
  printBoard();
  if(gameState == 100 || gameState == -100 || ply == 3)
    return gameState;

  
  if(curPlayer == 1)
  {
    bestScore = -10000;
    for(int i = 0; i < 9; i++)
    {
      if(board[i/3][i%3] == 0)
      {
        board[i/3][i%3] = 1;
        score = miniMax(0,ply+1);
        if(score > bestScore)
        {
          pos  = i;
          bestScore = score;
        }
        board[i/3][i%3] = 0;
      }
    }
   // board[pos/3][pos%3] = 1;
    println("Player 1 best score in position " + pos);
    return bestScore;
  }
  else
  {
    bestScore = 10000;
    for(int i = 0; i < 9; i++)
    {
      if(board[i/3][i%3] == 0)
      {
        board[i/3][i%3] = -1;
        score = miniMax(1,ply+1);
        if(score < bestScore)
        {
          pos  = i;
          bestScore = score;
        }
        board[i/3][i%3] = 0;
      }
    }
    //board[pos/3][pos%3] = -1;
    println("Player 2 best score in position " + pos);
    return bestScore;
  }
}


void setup()
{
   for(int i = 0; i < 9; i++)
    {
      board[i/3][i%3] = 0;  
    }
    board[0][0] = 1;
    board[0][1] = -1;
    board[0][2] = -1;
    board[1][1] = 1;
    
    miniMax(1,0);
}

void draw()
{
  
}