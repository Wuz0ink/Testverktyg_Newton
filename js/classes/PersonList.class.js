class PersonList extends List {

  constructor(items){
    super(Person,items);  
  }

  writeToDb(callback){
    var co = 0, listLength = this.length;
    function callbackEach(res){
      co++;
      if(co == listLength){ callback(); }
    }
    for(let Person of this){
      Person.insertInDb(callbackEach);
    }
  }

  readAllFromDb(callback){
    this.db.readAll((data)=>{
      this.push.apply(this,data);
        this.getAllByName();
      callback();
    });
  }
    
 getAllByName(){ // metod för att hämta namn och roll i array i ordnigng lärare - elev 
        
        this.db.allByName({  
        },(data)=>{
            $('.inloggning').empty();
           for(var i = 0; i < data.length; i++){
            if(data[i].roll == 'Student'){
            $('.inloggning').append('<li><a href="/Fragor">' + data[i].roll + ' ' + data[i].Name + '</a></li>'); 
            }else{
               $('.inloggning').append('<li><a href="/teacherprofile">' + data[i].roll + ' ' + data[i].Name + '</a></li>'); 
            }
           }     
        });
    }
    
        fillStudentList(){
        var n;
        $('.student-list').empty();
        this.db.allStudents({
        },(data)=>{
            for(let i = 0; i < data.length; i++){
                if(data[i].roll == 'Student'){ 
                    this.n = data[i].Name;
                    
                    $('.student-list').append('<tr><td><input type="radio" name="myTextEditBox"></td><td>' + data[i].pNr + '</td><td>' + this.n.substr(0, this.n.indexOf(' ')) + '</td><td>' + this.n.substr(this.n.indexOf(' '), this.n.length) + '</td><td>default@mail.com</td></tr>');
                 }
            }
            
        });
    }

  static get sqlQueries(){
    return {
    allStudents:`
        select pNr, Name, roll, klass from Person
    `,
    allByName: `
        select Name, roll from Person
        order by roll
    `,
      readAll: `
        SELECT * FROM Person
      `
    }
  }

}