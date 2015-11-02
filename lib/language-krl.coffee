{CompositeDisposable} = require 'atom'

module.exports = LanguageKrl =
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-krl:toggle': => @fold('toggle')
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-krl:fold': => @fold('fold')
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-krl:unfold': => @fold('unfold')

  deactivate: ->
    @subscriptions.dispose()

  fold: (mode) ->
    editor = atom.workspace.getActiveTextEditor()
