class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    # list = List.new(list_param)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    # list.save
    # 4. トップ画面へリダイレクト
    # redirect_to '/top'
    # redirect_to list_path(list.id)

    # 新規投稿後の動きを、topへのリダイレクトではなく、show.html.erbへリダイレクトさせて、投稿内容がすぐに閲覧できるようにしましょう。

    # link_toの送信先URLと同様に、「転送したいアクションへのURL」を指定します。
    # showアクションにリダイレクトさせるには、名前付きルートを使用して、 redirect_to list_path(list.id) と記述します。

    # redirect_to '/top' を削除して、以下コードに変更
    # 詳細画面へリダイレクト

    # 返されたバリデーションの結果を、コントローラで検出できるようにしましょう。

    # if式を用いて、対象のカラムにデータが入力されていればsaveメソッドでtrueが返されます。
    # この場合、次に表示したいページにリダイレクトさせます。

    # 対象のカラムにデータが入力されていなければ、saveメソッドでfalseが返されます。
    # falseならば、新規投稿ページを再表示するように設定します。

    @list = List.new(list_param)

    if @list.save

      flash[:notice] = "投稿完了いたしました。"
      redirect_to list_path(@list.id)
    else
      # ※ render :アクション名で、同じコントローラ内の別アクションのViewを表示できます。次の章で詳しく説明します。
      # flash[:notice] = "投稿完了いたしました。"
      render :new
    end
  end

  def index

    # @listsのように、アットマーク(@)付きの変数は、インスタンス変数と言います。
    # あらかじめControllerのアクションでインスタンス変数を指定しておくことで、viewファイル上でインスタンス変数に格納された情報を表示させることができます。
    # ※ 逆に、ここで指定しておかないと、インスタンス変数に格納した情報をviewファイル上で表示させることができません。

    # allはメソッドの一種で、そのモデルがやりとりしているデータベースのテーブルに保存されている、全てのレコードをまとめて取得します。
    # 今回の場合はListからallメソッドを呼び出しているので、listsテーブルに保存されている全てのデータを取得することができます。
    @lists = List.all

  end

  def show

    @list = List.find(params[:id])

  end

  def edit

    @list = List.find(params[:id])

  end

  def update

    list = List.find(params[:id])
    list.update(list_param)
    redirect_to list_path(list.id)

  end

  def destroy

    # データ（レコード）を1件取得
    list = List.find(params[:id])
    # データ（レコード）を削除
    list.destroy
    # 投稿一覧画面へリダイレクト
    redirect_to '/lists'

  end

  private

    # ストロングパラメータ
     def list_param

        # params
        # formから送られてくるデータはparamsの中に入っています。
        #
        # require
        # 送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り込みます。
        #
        # permit
        # requireで絞り込んだデータの中から、保存を許可するカラムを指定します。

       params.require(:list).permit(:title,:body,:image)

     end
end
