ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Normal Quizzes" do
          panel 'GK Quiz' do
            columns do
              column do
                link_to('GK', new_admin_quiz_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                Quiz.count
              end
            end
          end
          panel 'Bollywood Quiz' do
            columns do
              column do
                link_to('Bollywood', new_admin_bollywood_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                Bollywood.count
              end
            end
          end
          panel 'Cricket Quiz' do
            columns do
              column do
                link_to('Cricket', new_admin_cricket_quiz_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                CricketQuiz.count
              end
            end
          end
        end
      end
      column do
        panel 'Text Boolean Quiz' do
          panel 'Technology Quiz' do
            columns do
              column do
                link_to('Technology', new_admin_boolean_quiz_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                BooleanQuiz.count
              end
            end
          end
          panel 'Movie Quiz' do
            columns do
              column do
                link_to('Movie', new_admin_movie_quiz_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                MovieQuiz.count
              end
            end
          end
        end
      end
      column do
        panel 'Image Boolean Quiz' do
          panel 'Image One Quiz' do
            columns do
              column do
                link_to('Image One', new_admin_image_quiz_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                ImageQuiz.count
              end
            end
          end
          panel 'Image Two Quiz' do
            columns do
              column do
                link_to('Image Two', new_admin_image_boolean_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                ImageBoolean.count
              end
            end
          end
        end
      end
      column do
        panel "Total Swipe Quizzes" do
          panel 'Swipe Celebrity' do
            columns do
              column do
                link_to('Celebrity', new_admin_swipe_quiz_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                SwipeQuiz.count
              end
            end
          end
          panel 'Swipe Knowledge' do
            columns do
              column do
                link_to('Knowledge', new_admin_swipe_one_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                SwipeOne.count
              end
            end
          end
          panel 'Swipe Insta' do
            columns do
              column do
                link_to('Insta Fun', new_admin_swipe_instum_path, style: "display: inline-block;", class: 'button')
              end
              column align: 'center', style: "display: inline-block;" do
                SwipeInstum.count
              end
            end
          end
        end
      end
    end
  end
end
