lines = []
File.open('./h-navi_access.txt') do |f|
  f.each_line do |line|
    article_path = line.match(/\/column\/article\/(\d+)/)
    next unless article_path
    lines.push(article_path[1])
  end
  result = lines
    .group_by { |line| line.itself }
    .map { |key, value| {'記事id' => key, 'アクセス数' => value.count} }
    .sort { |access_count_one, access_count_two| access_count_two['アクセス数'] <=> access_count_one['アクセス数'] }
    .take(5)
  p result
end
