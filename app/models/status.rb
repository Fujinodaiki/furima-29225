class Status < ActiveHash::Base
  self.data =[
    { id: 1, name: '---'},
    { id: 2, name: '新品・未使用'},
    { id: 3, name: '目立った傷や汚れなし'},
    { id: 4, name: '傷や汚れあり'},
    { id: 5, name: '全体的に状態が悪い'}
  ]
end
