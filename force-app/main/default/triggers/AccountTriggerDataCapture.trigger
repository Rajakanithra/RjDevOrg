trigger AccountTriggerDataCapture on AccountChangeEvent (after insert) {
system.debug('This is AccountChangeEvent');
}