defmodule Discuss.CommentsChannel do
    use Discuss.Web, :channel

    #Two separate aliases statements condensed into one
    alias Discuss.{Topic, Comment}

    #first time communication with channel
    def join("comments:" <> topic_id, _params, socket) do
        topic_id = String.to_integer(topic_id)
        topic = Topic
            |> Repo.get(Topic, topic_id)
            |> Repo.preload(:comments)

        {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
    end

    #any follow up communication
    def handle_in(name, %{"content" => content}, socket) do
        topic = socket.assigns.topic

        changeset = topic
            |> build_assoc(:comments)
            |> Comment.changeset(%{content: content})

        case Repo.insert(changeset) do
            {:ok, comment} ->
                {:reply, :ok, socket}
            {:error, _reason} ->
                {:reply, {:error, %{errors: changeset}}, socket}
        end
    end
end