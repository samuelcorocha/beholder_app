class ApiCleric {
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
  Spellcasting spellcasting;
  String spells;
  String url;

  ApiCleric({
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
    required this.spellcasting,
    required this.spells,
    required this.url,
  });

}

class MultiClassing {
  List<MultiClassingPrerequisite> prerequisites;
  List<Proficiency> proficiencies;

  MultiClassing({
    required this.prerequisites,
    required this.proficiencies,
  });

}

class MultiClassingPrerequisite {
  Proficiency abilityScore;
  int minimumScore;

  MultiClassingPrerequisite({
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
  Proficiency item;

  PurpleOption({
    required this.optionType,
    required this.item,
  });

}

class Spellcasting {
  int level;
  Proficiency spellcastingAbility;
  List<Info> info;

  Spellcasting({
    required this.level,
    required this.spellcastingAbility,
    required this.info,
  });

}

class Info {
  String name;
  List<String> desc;

  Info({
    required this.name,
    required this.desc,
  });

}

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
  List<FluffyOption>? options;
  Proficiency? equipmentCategory;

  StartingEquipmentOptionFrom({
    required this.optionSetType,
    this.options,
    this.equipmentCategory,
  });

}

class FluffyOption {
  String optionType;
  int? count;
  Proficiency? of;
  List<OptionPrerequisite>? prerequisites;
  List<Item>? items;
  Choice? choice;

  FluffyOption({
    required this.optionType,
    this.count,
    this.of,
    this.prerequisites,
    this.items,
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

class Item {
  String optionType;
  int count;
  Proficiency of;

  Item({
    required this.optionType,
    required this.count,
    required this.of,
  });

}

class OptionPrerequisite {
  String type;
  Proficiency proficiency;

  OptionPrerequisite({
    required this.type,
    required this.proficiency,
  });

}
