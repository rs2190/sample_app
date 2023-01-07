Rails.application.routes.draw do

  # HTTPリクエスト
  # HTTP	          用途
  # GET	            データの取得(ページ自体もデータ)
  # POST          	新しいデータの作成
  # PUT           	既存のデータの更新
  # PATCH         	既存のデータの一部更新
  # DELETE	        既存のデータを削除

  get 'top' => 'homes#top'
  resources :lists

  # get 'lists/new'
  # get 'homes/top'

  # post 'lists' => 'lists#create'
  # get 'lists/index'
  # get 'lists' => 'lists#index'

  # get 'lists/show'
  # .../lists/1 や .../lists/3 に該当する


  # 詳細画面では、どの投稿データを表示するかを判別するために、投稿データのidもURLに含めます。
  # 詳細画面で呼び出される投稿データは、URLの/lists/:id内の:idで判別します。 この:idは、アクション内にparams[:id]と記述することで取得できます。
  # たとえば、URLが/lists/1の場合、params[:id] と記述すると、id=1を取り出せます。
  # get 'lists/:id' => 'lists#show'

  # .../lists/1 や .../lists/3 に該当する
  # as:オプションを追加することで設定ができます。 ここでは、「'lists#show'の設定を、listとして利用できる」の意味になります（asは、英語で「～として」の意味）。
  # get 'lists/:id' => 'lists#show', as: 'list'

  # get 'lists/edit'
  # get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'

  # patch 'lists/:id' => 'lists#update', as: 'update_list'
  # delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
