import { LightningElement,api,track } from 'lwc';
import addStudent from '@salesforce/apex/StudentServiceController.studentlist';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
  
export default class studentLWC extends LightningElement {
    
    @api recordId;
    @track name;
    @track fathersName;
    @track tamil;
    @track english;
    @track maths;
    @track science;
    @track social;
    @track onfoexample;
    @track afterSave = false;

    valueChanged(event) {
        var inputTypeName = event.target.label;
        console.log('@@@@@ Input Event TValue @@@@@@@ '+inputTypeName);

        if(inputTypeName == 'name') {
            this.name = event.detail.value;
           
            console.log('@@@@@ Name @@@@@@@ '+this.name);
        }
        if(inputTypeName == 'Fathers Name') {
            this.fathersName = event.detail.value;
            console.log('@@@@@ Fathers Name @@@@@@@ '+this.fathersName);
        }

        if(inputTypeName == 'English') {
            this.tamil = event.detail.value;
            console.log('@@@@@ Name @@@@@@@ '+this.tamil);
        }
        if(inputTypeName == 'Tamil') {
            this.english = event.detail.value;
            console.log('@@@@@ Name @@@@@@@ '+this.english);
        }
        if(inputTypeName == 'Maths') {
            this.maths = event.detail.value;
            console.log('@@@@@ Name @@@@@@@ '+this.maths);
        }
        if(inputTypeName == 'Science') {
            this.science = event.detail.value;
            console.log('@@@@@ Name @@@@@@@ '+this.science);
        }
        if(inputTypeName == 'Social') {
            this.social = event.detail.value;
            console.log('@@@@@ Name @@@@@@@ '+this.social);
        }
     }
    handleOnSave() {
        this.afterSave = true;
        console.log('@@@@@@@@ Name @@@@@@@'+this.name);
        console.log('@@@@@@@@ Fathers Namw @@@@@@@'+this.fathersName);
        addStudent({name: this.name, fathersName : this.fathersName, tamil: this.tamil, english : this.english, maths: this.maths, science:this.science,social:this.social })
                        .then(result => {
                            console.log('result',JSON.stringify(result));
                            if(result) {
                                this.name={};this.fathersName={};this.tamil={};this.english={};this.maths={};this.science={};this.social={};
                                 this.dispatchEvent(
                                        new ShowToastEvent({
                                            title: 'Success!!',
                                            message: "Student Record Created Successfully.",
                                            variant: 'success'}),);
                            }
                        })
                        .catch(error => {})
    }
    handleOnDelete() {

    }
    handleOnUpdate() {

    }
    handleInputFocus(event){
        const classList = event.target.parentNode.classList;
        classList.add('lgc-highlight');
    }
    handleInputBlur(event){
        const classList = event.target.parentNode.classList;
        classList.remove('lgc-highlight');
    }
}