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
    super(propertyValues)

  }

      /*static get sqlQueries(){

    return {
        newTest: `
        INSERT Test SET ?
`
    }
  } */
}