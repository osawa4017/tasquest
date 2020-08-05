class Classification < ActiveHash::Base
  self.data = [
    {id: 0, name: '選択してください'},
    {id: 1, name: 'Routine Task' },
    {id: 2, name: 'ToDo Task'    },
  ]
end
