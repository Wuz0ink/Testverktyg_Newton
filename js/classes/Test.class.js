class Test extends Base {
    
    static defaultPropertyValues(){
    return {
      id: '1',
      Title: 'Provets namn',
      Start: '',
      Slut: '',
    }
  }
    
    constructor(propertyValues){
      super(propertyValues);
        
      if(propertyValues.Person_pNr){
        this.id = propertyValues.idTest;
        this.pNr = propertyValues.Person_pNr;
      }
  }
    
    getTest(callback){
        this.db.getTest([this.id], (data)=>{
            this.id = data[0].idTest;
            this.Title = data[0].Title;
            this.Start = data[0].start;
            this.Slut = data[0].stop;
            callback && callback(this);
        });
    }  
    
    static get sqlQueries(){
        return {
        getTest:`
            SELECT * FROM Test WHERE idTest=?
        `
    }
  }

}