ActiveAdmin.register Subject do
  permit_params :name, notes_ids: []
  show title: "My title" do
    h3 'you have ' + pluralize(subject.notes.count, 'note') + ' for this subject'
    subject.notes.each do |note|
       div do
        h1 note.title
        h4 link_to "[#{note.id}]: you created this note on #{note.created_at.strftime('%a%b%e,%Y at 1107 PM')}",admin_note_path(note)
      end
    end
  end
end
