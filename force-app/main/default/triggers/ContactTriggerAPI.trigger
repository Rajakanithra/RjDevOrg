trigger ContactTriggerAPI on Contact (after insert) {
    new NameGenderApi().run();
}