module_path='Classes/Presentation/Modules/'
service_path='Classes/BusinessLogic/Services'
component_path='Classes/Presentation/Components'

if which generamba >/dev/null; then
  for entry in "Templates"/*
  do
    template_name="$(basename "$entry")"
    if [[ $template_name = *"$1"* ]]; then
      if [[ $1 = "module" ]]; then
        CMD="generamba gen $2 $template_name --module_path $module_path"
      elif [[ $1 = "service" ]]; then
        CMD="generamba gen $2 $template_name --module_path '$service_path'"
      elif [[ $1 = "component" ]]; then
        if [[ -z $3 ]]; then
          CMD="generamba gen $2 $template_name --module_path $component_path"
        else
          CMD="generamba gen $3 $template_name --module_path $module_path$2/Components"
        fi
      fi
        
      echo "Generating component with command:" $CMD
      eval "$CMD"
      break
    fi
  done
else
  echo "Generamba is not installed. Run 'gem install generamba' or visit web page 'https://github.com/rambler-digital-solutions/Generamba'"
  exit 1
fi
