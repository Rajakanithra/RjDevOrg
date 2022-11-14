import {LightningElement, track, api} from 'lwc';
import createStudentRecord from '@salesforce/apex/StudentResultManagement.createStudentRecord';
import NAME_FIELD from '@salesforce/schema/Student__c.Name';
import FATHERNAME_FIELD from '@salesforce/schema/Student__c.FatherName__c';
import LANGUAGE_FIELD from '@salesforce/schema/Student__c.Language__c';
import ENGLISH_FIELD from '@salesforce/schema/Student__c.English__c';
import MATHS_FIELD from '@salesforce/schema/Student__c.Maths__c';
import SCIENCE_FIELD from '@salesforce/schema/Student__c.Science__c';
import SOCIAL_FIELD from '@salesforce/schema/Student__c.Social_Science__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class InputTextAdvanced extends LightningElement {
    @api recordId;
    @track error;
    @track rec = {
        Name: NAME_FIELD,
        FatherName__c: FATHERNAME_FIELD,
        Language__c: LANGUAGE_FIELD,
        English__c: ENGLISH_FIELD,
        Maths__c: MATHS_FIELD,
        Science__c: SCIENCE_FIELD,
        Social_Science__c: SOCIAL_FIELD
    }
    handleInputFocus(event) {
        const classList = event.target.parentNode.classList;
        classList.add('lgc-highlight');
    }

    handleInputBlur(event) {
        const classList = event.target.parentNode.classList;
        classList.remove('lgc-highlight');
    }

    handleInputChange(event) {
        var inputTypeName = event.target.label;
        if(inputTypeName == 'Name')
        {
            this.rec.Name = event.detail.value;
        }
        if(inputTypeName== 'Father Name')
        {
            this.rec.FatherName__c = event.detail.value;
        }
        if(inputTypeName == 'Language Mark')
        {
            this.rec.Language__c = event.detail.value;
        }
        if(inputTypeName == 'English Mark')
        {
            this.rec.English__c = event.detail.value;
        }
        if(inputTypeName == 'Maths Mark')
        {
            this.rec.Maths__c = event.detail.value;
        }
        if(inputTypeName == 'Science Mark')
        {
            this.rec.Science__c = event.detail.value;
        }
        if(inputTypeName == 'Social Science Mark')
        {
            this.rec.Social_Science__c = event.detail.value;
        }
}
    createRecord()
    {
     createStudentRecord({newRecord: this.rec})
        .then((result) =>  {
           this.rec = eval("$A.get('e.force:refreshView').fire();") 
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