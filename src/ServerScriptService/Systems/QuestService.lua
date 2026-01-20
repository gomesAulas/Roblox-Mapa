local Quests = require(game.ReplicatedStorage.Config.Quests)

local QuestService = {}

function QuestService.getQuest(questId)
  return Quests[questId]
end

function QuestService.startQuest(profile, questId)
  profile.ActiveQuests = profile.ActiveQuests or {}
  if profile.ActiveQuests[questId] then
    return false, "Missao ja ativa"
  end

  local quest = Quests[questId]
  if not quest then
    return false, "Missao nao encontrada"
  end

  profile.ActiveQuests[questId] = {
    Progress = {},
    Completed = false,
  }

  return true, quest
end

function QuestService.updateProgress(profile, questId, objectiveType, target)
  local questProgress = profile.ActiveQuests and profile.ActiveQuests[questId]
  if not questProgress or questProgress.Completed then
    return false
  end

  questProgress.Progress[objectiveType] = questProgress.Progress[objectiveType] or {}
  questProgress.Progress[objectiveType][target] = (questProgress.Progress[objectiveType][target] or 0) + 1
  return true
end

return QuestService
