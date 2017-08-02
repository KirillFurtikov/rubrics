crumb :root do
  link t('main'), root_path
end

crumb :rubrics do
  link Rubric.model_name.human, rubrics_path
end

crumb :rubric do |rubric|
  link rubric.title || %Q(новая #{rubric.model_name.human}).capitalize, rubrics_path(rubric_id: rubric)
  if rubric.rubric
    parent :rubric, rubric.rubric
  else
    parent :rubrics
  end
end
