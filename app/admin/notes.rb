ActiveAdmin.register Note do
  permit_params :title, :body, :subject_id

  form title: 'Notes App' do |form|
    form.inputs 'Note' do
    form.input :subject
    form.input :title
    form.input :body, as: :quill_editor
  end
  form.actions
end

  show title: 'Your Note' do
    h1 link_to note.title, admin_notes_path
    h4 link_to note.subject.name,admin_subject_path(note.subject)
    div(class: 'note-body') do
      raw note.body
    end
  end

  index do 
    selectable_column
    column :subject
    column :title do |note|
      link_to note.title,admin_note_path(note)
    end
    column :body do |note|
      raw note.body.truncate_words(25)
    end
    column :created_at
    column :updated_at
   end
  end
