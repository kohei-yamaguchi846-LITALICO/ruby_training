# frozen_string_literal: true

# # frozen_string_literal: true

# # コースリスト： コース ID => [ コース名, 単位数 ]
# courses = [{ 'M2001' => ['数学２-１', 2] },
#            { 'M3001' => ['数学３-1', 4] },
#            { 'E1001' => ['英語１', 2] },
#            { 'E1002' => ['英語２', 2] },
#            { 'H3001' => ['歴史３-１', 3] }]

# # 教師リスト： 教師 ID => [ 教師名, [ 担当コース ID のリスト ] ]
# teachers = [{ 1 => ['佐藤', %w[E1001 E1002]] },
#             { 2 => ['鈴木', %w[M2001 M3001]] }]

courses.each do |course|
  c_id = course.keys[0]
  t_teacher = teachers.find do |teacher|
    t_charge_course_ids = teacher.values[0][1]
    t_charge_course_ids.include?(c_id)
  end
  if t_teacher
    p course.values[0][0] + ':' + t_teacher.values[0][0]
  else
    p course.values[0][0] + ':' + '担当なし'
  end
end
