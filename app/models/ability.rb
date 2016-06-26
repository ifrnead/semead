class Ability
  include CanCan::Ability

  def initialize(usuario)

    usuario ||= Usuario.new

    if usuario.admin?
      can :manage, :all
    end

    if usuario.tem_perfil?('membro_comissao_central')
      can :manage, Organizador
      can :manage, Participante
      can [ :show, :index ], Trabalho
    end

    if usuario.tem_perfil?('coordenador_comissao_cientifica')
      can [ :index, :show ], Participante
      can :manage, Trabalho
      can :manage, AvaliacaoTrabalho
    end

    if usuario.tem_perfil?('coordenador_linha_pesquisa')
      can [ :index, :show ], Participante
      can :manage, Trabalho
      can :manage, AvaliacaoTrabalho
    end

    if usuario.tem_perfil?('membro_comissao_cientifica')
      can [ :index, :show ], Participante
      can [ :index, :show, :edit, :update ], Trabalho
      can :manage, AvaliacaoTrabalho
    end

    if usuario.tem_perfil?('secretario')
      can :manage, Participante
      can :manage, Organizador
    end

    if usuario.tem_perfil?('participante')
      can :show, Participante, id: usuario.autenticavel.id
      can :create, Trabalho
      can :index, Trabalho
      can :show, Trabalho, participante_id: usuario.autenticavel.id
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
