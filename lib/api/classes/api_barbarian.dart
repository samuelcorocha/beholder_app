class ApiBarbarian {
  String index;
  String name;
  int hitDie;
  List<ProficiencyChoice> proficiencyChoices;
  List<Proficiency> proficiencies;
  List<Proficiency> savingThrows;
  List<StartingEquipment> startingEquipment;
  List<StartingEquipmentOption> startingEquipmentOptions;
  String classLevels;
  MultiClassing multiClassing;
  List<Proficiency> subclasses;
  String url;

  ApiBarbarian({
    required this.index,
    required this.name,
    required this.hitDie,
    required this.proficiencyChoices,
    required this.proficiencies,
    required this.savingThrows,
    required this.startingEquipment,
    required this.startingEquipmentOptions,
    required this.classLevels,
    required this.multiClassing,
    required this.subclasses,
    required this.url,
  });

  factory ApiBarbarian.fromJson(dynamic json) {
    return ApiBarbarian(
      index: json['index'] as String,
      name: json['name'] as String,
      hitDie: json['hit_die'] as int,
      proficiencyChoices: json['proficiency_choices'] as List<ProficiencyChoice>,
      proficiencies: json['proficiencies'] as List<Proficiency>,
      savingThrows: json['saving_throws'] as List<Proficiency>,
      startingEquipment: json['starting_equipment'] as List<StartingEquipment>,
      startingEquipmentOptions: json['starting_equipment_options'] as List<StartingEquipmentOption>,
      classLevels: json['class_levels'] as String,
      multiClassing: json['multi_classing'] as MultiClassing,
      subclasses: json['subclasses'] as List<Proficiency>,
      url: json['url'] as String
    );
  }
}

class MultiClassing {
  List<Prerequisite> prerequisites;
  List<Proficiency> proficiencies;

  MultiClassing({
    required this.prerequisites,
    required this.proficiencies,
  });

  factory MultiClassing.fromJson(dynamic json) {
    return MultiClassing(
      prerequisites: json['multi_classing']['prerequisites'] as List<Prerequisite>,
      proficiencies: json['multi_classing']['proficiencies'] as List<Proficiency>,
    );
  }

}

class Prerequisite {
  Proficiency abilityScore;
  int minimumScore;

  Prerequisite({
    required this.abilityScore,
    required this.minimumScore,
  });

  factory Prerequisite.fromJson(dynamic json) {
    return Prerequisite(
      abilityScore: json['multi_classing']['prerequisites']['ability_score'] as Proficiency,
      minimumScore: json['multi_classing']['prerequisites']['minimum_score'] as int
    );
  }

}

class Proficiency {
  String index;
  String name;
  String url;

  Proficiency({
    required this.index,
    required this.name,
    required this.url,
  });

  factory Proficiency.fromJson(dynamic json) {
    return Proficiency(
      index: json['index'],
      name: json['name'],
      url: json['url']
    );
  }

}

class ProficiencyChoice {
  String desc;
  int choose;
  String type;
  ProficiencyChoiceFrom from;

  ProficiencyChoice({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

  factory ProficiencyChoice.fromJson(dynamic json) {
    return ProficiencyChoice(
      desc: json['proficiency_choices']['desc'] as String,
      choose: json['proficiency_choices']['choose'] as int,
      type: json['proficiency_choices']['type'] as String,
      from: json['proficiency_choices']['from'] as ProficiencyChoiceFrom
    );
  }

}

class ProficiencyChoiceFrom {
  String optionSetType;
  List<PurpleOption> options;

  ProficiencyChoiceFrom({
    required this.optionSetType,
    required this.options,
  });

  factory ProficiencyChoiceFrom.fromJson(dynamic json) {
    return ProficiencyChoiceFrom(
      optionSetType: json['proficiency_choices']['from']['option_set_type'] as String,
      options: json['proficiency_choices']['from']['options'] as List<PurpleOption>
    );
  }

}

class PurpleOption {
  String optionType;
  Proficiency item;

  PurpleOption({
    required this.optionType,
    required this.item,
  });

  factory PurpleOption.fromJson(dynamic json) {
    return PurpleOption(
      optionType: json['proficiency_choices']['from']['options']['option_type'] as String,
      item: json['proficiency_choices']['from']['options']['item'] as Proficiency
    );
  }

}

class StartingEquipment {
  Proficiency equipment;
  int quantity;

  StartingEquipment({
    required this.equipment,
    required this.quantity,
  });

  factory StartingEquipment.fromJson(dynamic json) {
    return StartingEquipment(
      equipment: json['starting_equipment']['equipment'] as Proficiency,
      quantity: json['starting_equipment']['quantity'] as int
    );
  }

}

class StartingEquipmentOption {
  String desc;
  int choose;
  String type;
  StartingEquipmentOptionFrom from;

  StartingEquipmentOption({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

}

class StartingEquipmentOptionFrom {
  String optionSetType;
  List<FluffyOption> options;

  StartingEquipmentOptionFrom({
    required this.optionSetType,
    required this.options,
  });

}

class FluffyOption {
  String optionType;
  int? count;
  Proficiency? of;
  Choice? choice;

  FluffyOption({
    required this.optionType,
    this.count,
    this.of,
    this.choice,
  });

}

class Choice {
  String desc;
  int choose;
  String type;
  ChoiceFrom from;

  Choice({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

}

class ChoiceFrom {
  String optionSetType;
  Proficiency equipmentCategory;

  ChoiceFrom({
    required this.optionSetType,
    required this.equipmentCategory,
  });

}
