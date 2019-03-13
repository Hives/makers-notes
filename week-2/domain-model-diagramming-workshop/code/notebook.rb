class Notebook
  attr_accessor :stored_notes

  def initialize(note = Note)
    @note = note
    @stored_notes = []
  end

  def add_note(note_text, tag = nil)
    @stored_notes << @note.new(note_text, tag)
  end

  def find(tag)
    @stored_notes.select do |note|
      note.has_tag?(tag)
    end
  end
end

class Note
  def initialize(note_text, tag = nil)
    @text = note_text
    @tag = tag
  end

  def tag(tag)
    @tag = tag
  end

  def has_tag?(tag)
    @tag == tag
  end
end