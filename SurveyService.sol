pragma solidity ^0.4.21;

// Author: MissaouiMounir
// Date: 08-04-2018-8:24:30
// Description: Survey Service on the Ethereum Network

contract SurveyService{
    
    
   struct User{
      
    address userId;
     //here input data needed to be colleced about your users
 
}
struct Option{
   
        uint OptionId;
        string OptionText;
        uint userNumber;
         //array of users that answered with this Option;
        mapping (uint => User)  Users;
        
}
  struct Question{
      uint  QuestionId;
     
        string  QuestionText;
        uint OptionNumber;
        mapping (uint => Option) Options;
  
    
}
    
    
uint public TotalUsers;
    uint public QuestionNumber=0;
    mapping (uint => Question) public QuestionsMap;
    //mapping of all users that answered regardless of the option
    mapping (uint => User) public AnswerdUsers;
    
    
    function addQuestion(string _questionText) public returns (bool success, uint QuestionID){
         
        QuestionsMap[QuestionNumber++] = Question(QuestionNumber,_questionText,0);
      
        return(true,QuestionNumber);
        
    }
    function addOption(uint _questionId,string _OptionText)public {
        Question storage Q = QuestionsMap[_questionId];
        Q.Options[Q.OptionNumber++] = Option(Q.OptionNumber,_OptionText,0);
     
    }
    function getQuestion( uint _questionId) public constant returns(uint,string,uint){
        Question storage q = QuestionsMap[_questionId];
        return (q.QuestionId,q.QuestionText,q.OptionNumber);
    }
    function AnswerQuestion (uint _questionId, uint _optionId) public{
        Question storage Q = QuestionsMap[_questionId];
        Option storage O = Q.Options[_optionId];
        O.Users[O.userNumber++] = User(msg.sender);
        AnswerdUsers[TotalUsers++] = User(msg.sender);
        
    }

    
}