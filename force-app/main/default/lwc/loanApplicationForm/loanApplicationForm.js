import {
  LightningElement,
  track,
  api
} from "lwc";
import {
  refreshApex
} from "@salesforce/apex";
import personalLoanFun from '@salesforce/apex/LoanApplicationHandler.getPersonalLoanDetails';

export default class LoanApplicationForm extends LightningElement {
  @track isModalOpen = false;
  @track isLoaded = false;
  @track loanType;
  @track step = 1;
  @track currStep = 1;
  @track isPersonalInfo = false;
  @track isWorkInfo = false;
  @track PerLoan = {
   Name :'',
   fatherName : '',
   motherName : '',
   Age : '',
   Place : '',
   contactNum : '',
   email : '',
   DateOfBirth : '',
   companyName : '',
   totWorkExp : '',
   officeLoc : '',
   empType :'',
   jobSec :'',
   currCtc :'',
};

  closeModal(){
      this.isModalOpen = false;
      this.step = 1;
      this.currStep = this.step.toString();
  }
selectStep1() {
 
    this.isPersonalInfo = true;
    this.isWorkInfo = false;

}

selectStep2() {
  
    this.isPersonalInfo = false;
    this.isWorkInfo = true;
}

selectStep3() {
  
    this.isPersonalInfo = false;
    this.isWorkInfo = false;
}
selectStep4() {
   
    this.isPersonalInfo = false;
    this.isWorkInfo = false;
}
handleChange(event)
{
    console.log(event.target.label);
    var inp = this.template.querySelectorAll("input, select");
    inp.forEach(function(element){
        if(element.id == "form-element-01-252")
        {
            this.PerLoan.Name = element.value;
            console.log(this.Name);
        }
        if(element.id == "form-element-02-252")
        {
            this.PerLoan.fatherName = element.value;
            console.log(this.fatherName);
        }
        if(element.id == "form-element-03-252")
        {
            this.PerLoan.motherName = element.value;
            console.log(this.motherName);
        }
        if(element.id == "form-element-04-252")
        {
            this.PerLoan.contactNum = element.value;
            console.log(this.contactNum);
        }
        if(element.id == "form-element-05-252")
        {
            this.PerLoan.Age = element.value;
            console.log(this.Age);
        }
        if(element.id == "form-element-06-252")
        {
            this.PerLoan.DateOfBirth = element.value;
            console.log(this.DateOfBirth);
        }
        if(element.id == "form-element-07-252")
        {
            this.PerLoan.Place = element.value;
            console.log(this.Place);
        }
        if(element.id == "form-element-08-252")
        {
            this.PerLoan.email = element.value;
            console.log(this.email);
        }
        if(element.id == "form-element-09-252")
        {
            this.PerLoan.companyName = element.value;
            console.log(this.companyName);
        }
        if(element.id == "form-element-10-252")
        {
            this.PerLoan.totWorkExp = element.value;
            console.log(this.totWorkExp);
        }
        if(element.id == "form-element-11-252")
        {
            this.PerLoan.officeLoc = element.value;
            console.log(this.officeLoc);
        }
        if(element.id == "select-01-252")
        {
            this.PerLoan.empType = element.value;
            console.log(this.empType);
        }
        if(element.id == "select-02-252")
        {
            this.PerLoan.jobSec = element.value;
            console.log(this.jobSec);
        }
        if(element.id == "form-element-12-252")
        {
            this.PerLoan.currCtc = element.value;
            console.log(this.currCtc);
        }
       

    },this);
} 


  nextPage(event) {
    if (this.step < 4) {
        this.step++;
        this.currStep = this.step.toString();
      this.isLoaded = true;
      new Promise(
          (resolve, reject) => {
              setTimeout(() => {
                  if (this.currStep == "1") {
                      this.isWorkInfo = false;
                      this.isPersonalInfo = true;

                  } else if (this.currStep == "2") {
                      this.isWorkInfo = true;
                      this.isPersonalInfo = false;

                  } else if (this.currStep == "3") {
                      this.isWorkInfo = false;
                      this.isPersonalInfo = false;

                  } else if (this.currStep == "4") {
                      this.isWorkInfo = false;
                      this.isPersonalInfo = false;
                  }
                  resolve();
              }, 1000);
          }).then(
          () => this.isLoaded = false
      );
    }
  }
  prevPage(_event) {
    if (this.step > 1) {
        this.step--;
        this.currStep = this.step.toString();
      this.isLoaded = true;
      new Promise(
          (resolve, reject) => {
              setTimeout(() => {

                  if (this.currStep == "1") {
                      this.isWorkInfo = false;
                      this.isPersonalInfo = true;

                  } else if (this.currStep == "2") {
                      this.isWorkInfo = true;
                      this.isPersonalInfo = false;

                  }  else if (this.currStep == "3") {
                      this.isWorkInfo = false;
                      this.isPersonalInfo = false;

                  }  else if (this.currStep == "4") {
                      this.isWorkInfo = false;
                      this.isPersonalInfo = false;
                  }
                  resolve();
              }, 1000);
          }).then(
          () => this.isLoaded = false
      );
          }
  }
  perLoan(event) {
    this.isLoaded = true;
    new Promise(
        (resolve, reject) => {
            setTimeout(() => {
                this.isPersonalInfo = true;
                this.isWorkInfo = false;
                this.isModalOpen = true;
                resolve();
            }, 1000);
        }).then(
        () => this.isLoaded = false
    );
       this.loanType = event.target.label;
  }
  vehLoan(event) {
    this.isLoaded = true;
    new Promise(
        (resolve, reject) => {
            setTimeout(() => {
                this.isPersonalInfo = true;
                this.isWorkInfo = false;
                this.isModalOpen = true;
                resolve();
            }, 1000);
        }).then(
        () => this.isLoaded = false
    );
       this.loanType = event.target.label;
  }
  eduLoan(event) {
    this.isLoaded = true;
    new Promise(
        (resolve, reject) => {
            setTimeout(() => {
                this.isPersonalInfo = true;
                this.isWorkInfo = false;
                this.isModalOpen = true;
                resolve();
            }, 1000);
        }).then(
        () => this.isLoaded = false
    );
       this.loanType = event.target.label;
  }
  hmeLoan(event) {
    this.isLoaded = true;
    new Promise(
        (resolve, reject) => {
            setTimeout(() => {
                this.isPersonalInfo = true;
                this.isWorkInfo = false;
                this.isModalOpen = true;
                resolve();
            }, 1000);
        }).then(
        () => this.isLoaded = false
    );
       this.loanType = event.target.label;
  }

  createRecord()
  {
    personalLoanFun({customer: this.PerLoan})
      .then((result) =>  {
         this.PerLoan = {};
         this.dispatchEvent(
                 new ShowToastEvent({
                  title: 'Success',
                  message: 'created',
                  variant : 'success',
                 }),);
                 
         console.log(JSON.stringify(result));
      })
      
      .catch(error =>{
          alert(result);
          this.message = undefined;
          this.error = error;
          this.dispatchEvent(
              new ShowToastEvent({
                  title: 'Errorr creating Record',
                  message: error.body.message,
                  variant : 'error',
              }),
          );
          console.log('error',JSON.stringify(this.error));
      });
  }
  
}