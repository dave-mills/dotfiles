tmux new-session -d -s laravel-with-search
tmux split-window -v 'php artisan queue:listen'
tmux split-window -h 'php artisan reverb:start'
tmux split-window -h 'vite'
tmux select-pane -t 1
tmux split-window -h 'meilisearch --master-key aSampleMasterKey'