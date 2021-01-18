class DuelService
  def initialize(fighter1, fighter2, equipments)
    @duel = Duel.new(
      fighter1: fighter1,
      fighter2: fighter2,
      equipments: equipments
    )
  end

  def execute
    log_intro

    defendant = @duel.fighter1
    attacker = @duel.fighter2

    while no_dead
      attacker, defendant = defendant, attacker
      attack(attacker, defendant)
      log_attack(attacker, defendant)
    end

    @duel.winner = attacker
    @duel
  end

  private

  def log_intro
    @duel.logs << '============================================================='
    @duel.logs << "#{@duel.fighter1.name} with health: #{@duel.fighter1.health}, attack: #{@duel.fighter1.attack}"
    @duel.logs << '==============================VS============================='
    @duel.logs << "#{@duel.fighter2.name} with health: #{@duel.fighter2.health}, attack: #{@duel.fighter2.attack}"
    @duel.logs << '============================================================='
    @duel.logs << "Equipments: #{@duel.equipments.map(&:name).join(', ')}"
    @duel.logs << '============================================================='
  end

  def no_dead
    @duel.fighter1.is_survivor && @duel.fighter2.is_survivor
  end

  def log_attack(attacker, defendant)
    @duel.logs << "#{attacker.name}(#{attacker.health}) attacks #{defendant.name}(#{defendant.health.negative? ? 0 : defendant.health})"
  end

  def attack(attacker, defendant)
    damage = measure_attacks(attacker)
    protection = measure_protections(defendant)
    defendant.health -= damage - protection
  end

  def measure_attacks(attacker)
    attacker.attack + @duel.equipments.sum(&:force)
  end

  def measure_protections(_defendant)
    @duel.equipments.sum(&:protection)
  end
end
