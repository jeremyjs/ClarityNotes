(function() {
  'use strict';

 /**
  * function initializeModel(model)
  * Called the first time the Realtime model is created for a file
  * Initialize any values of the model here
  * @param model {gapi.drive.realtime.Model} (root model)
  */
  function initializeModel(model) {
    // create a string model named 'text' that will be used to control our text box
    var string = model.createString('Hello Realtime World!');
    model.getRoot().set('text', string);
  }

  /**
   * function onFileLoaded(doc)
   * Called when the Realtime file has been loaded
   * Initialize user interface components and event handlers that depend on the root model
   * @param doc {gapi.drive.realtime.Document} (Realtime document)
   */
  function onFileLoaded(doc) {
    // Create a text control binder and bind it to our string model that we created in initializeModel
    var string = doc.getModel().getRoot().get('text');

    // Keeping one box updated with a String binder.
    var textArea1 = document.getElementById('editor1');
    gapi.drive.realtime.databinding.bindString(string, textArea1);

    // Keeping one box updated with a custom EventListener.
    var textArea2 = document.getElementById('editor2');
    var updateTextArea2 = function(e) {
      textArea2.value = string;
    };
    string.addEventListener(gapi.drive.realtime.EventType.TEXT_INSERTED, updateTextArea2);
    string.addEventListener(gapi.drive.realtime.EventType.TEXT_DELETED, updateTextArea2);
    textArea2.onkeyup = function() {
      string.setText(textArea2.value);
    };
    updateTextArea2();

    // Enabling UI Elements.
    textArea1.disabled = false;
    textArea2.disabled = false;

    // Add logic for undo button.
    var model = doc.getModel();
    var undoButton = document.getElementById('undoButton');
    var redoButton = document.getElementById('redoButton');

    undoButton.onclick = function(e) {
      model.undo();
    };
    redoButton.onclick = function(e) {
      model.redo();
    };

    // Add event handler for UndoRedoStateChanged events.
    var onUndoRedoStateChanged = function(e) {
      undoButton.disabled = !e.canUndo;
      redoButton.disabled = !e.canRedo;
    };
    model.addEventListener(gapi.drive.realtime.EventType.UNDO_REDO_STATE_CHANGED, onUndoRedoStateChanged);
  }

  /**
   * Options for the Realtime loader.
   */
  var realtimeOptions = {
    clientId: '854283895166-532bjm4eps1sal6542p7da8p51ngbjc2.apps.googleusercontent.com',

    // The ID of the button to click to authorize. Must be a DOM element ID.
    authButtonElementId: 'authorizeButton',

    // Called when a Realtime model is first created.
    initializeModel: initializeModel,

    // Create files right after auth automatically.
    autoCreate: true,

    // The name of newly created Drive files.
    defaultTitle: "New Realtime Quickstart File",

    // The MIME type of newly created Drive Files.
    // By default, the application specific MIME type will be used: application/vnd.google-apps.drive-sdk
    newFileMimeType: null,

    // Called every time a Realtime file is loaded.
    onFileLoaded: onFileLoaded,

    // Called to initialize custom Collaborative Objects types.
    registerTypes: null, // No action.

    // Called after authorization and before loading files.
    afterAuth: null // No action.
  };

  function startRealtime() {
    var realtimeLoader = new rtclient.RealtimeLoader(realtimeOptions);
    realtimeLoader.start();
  }
}());

