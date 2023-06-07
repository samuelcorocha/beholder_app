class ApiMonk {
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

  ApiMonk({
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

}

class MultiClassing {
  List<Prerequisite> prerequisites;
  List<Proficiency> proficiencies;

  MultiClassing({
    required this.prerequisites,
    required this.proficiencies,
  });

}

class Prerequisite {
  Proficiency abilityScore;
  int minimumScore;

  Prerequisite({
    required this.abilityScore,
    required this.minimumScore,
  });

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

}

class ProficiencyChoiceFrom {
  String optionSetType;
  List<PurpleOption> options;

  ProficiencyChoiceFrom({
    required this.optionSetType,
    required this.options,
  });

}

class PurpleOption {
  String optionType;
  Proficiency? item;
  PurpleChoice? choice;

  PurpleOption({
    required this.optionType,
    this.item,
    this.choice,
  });

}

class PurpleChoice {
  String desc;
  String type;
  int choose;
  PurpleFrom from;

  PurpleChoice({
    required this.desc,
    required this.type,
    required this.choose,
    required this.from,
  });

}

class PurpleFrom {
  String optionSetType;
  List<FluffyOption> options;

  PurpleFrom({
    required this.optionSetType,
    required this.options,
  });

}

class FluffyOption {
  OptionType optionType;
  Proficiency item;

  FluffyOption({
    required this.optionType,
    required this.item,
  });

}

enum OptionType { REFERENCE }

class StartingEquipment {
  Proficiency equipment;
  int quantity;

  StartingEquipment({
    required this.equipment,
    required this.quantity,
  });

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
  List<TentacledOption> options;

  StartingEquipmentOptionFrom({
    required this.optionSetType,
    required this.options,
  });

}

class TentacledOption {
  String optionType;
  int? count;
  Proficiency? of;
  FluffyChoice? choice;

  TentacledOption({
    required this.optionType,
    this.count,
    this.of,
    this.choice,
  });

}

class FluffyChoice {
  String desc;
  int choose;
  String type;
  FluffyFrom from;

  FluffyChoice({
    required this.desc,
    required this.choose,
    required this.type,
    required this.from,
  });

}

class FluffyFrom {
  String optionSetType;
  Proficiency equipmentCategory;

  FluffyFrom({
    required this.optionSetType,
    required this.equipmentCategory,
  });

}
