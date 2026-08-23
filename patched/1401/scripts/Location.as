package
{
   import utils.§_-c10§;
   
   public class Location
   {
      
      public var id:int = -1;
      
      public var name:String = "";
      
      public var level:int = 0;
      
      public var cost:int = 0;
      
      public var award:int = 0;
      
      public var teamMode:Boolean = false;
      
      public var §_-L1j§:Boolean = false;
      
      public var §_-F2e§:Boolean = false;
      
      public var game:Boolean = false;
      
      public var respawn:Boolean = false;
      
      public var nonHare:Boolean = false;
      
      public var nonPerk:Boolean = false;
      
      public var nonClothes:Boolean = false;
      
      public var nonItems:Boolean = false;
      
      public var subs:Array = null;
      
      public var modes:Array = null;
      
      public var mapModes:Array = null;
      
      public function Location(param1:Object = null)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         if("value" in param1)
         {
            this.id = param1["value"];
         }
         if("name" in param1)
         {
            this.name = param1["name"];
         }
         if("level" in param1)
         {
            this.level = param1["level"];
         }
         if("cost" in param1)
         {
            this.cost = param1["cost"];
         }
         if("award" in param1)
         {
            this.award = param1["award"];
         }
         if("teamMode" in param1)
         {
            this.teamMode = Boolean(param1["teamMode"]);
         }
         if("game" in param1)
         {
            this.game = Boolean(param1["game"]);
         }
         if("respawn" in param1)
         {
            this.respawn = Boolean(param1["respawn"]);
         }
         if("nonHare" in param1)
         {
            this.nonHare = Boolean(param1["nonHare"]);
         }
         if("nonPerk" in param1)
         {
            this.nonPerk = Boolean(param1["nonPerk"]);
         }
         if("nonClothes" in param1)
         {
            this.nonClothes = Boolean(param1["nonClothes"]);
         }
         if("nonItems" in param1)
         {
            this.nonItems = Boolean(param1["nonItems"]);
         }
         if("subs" in param1)
         {
            this.subs = param1["subs"];
         }
         if("modes" in param1)
         {
            this.modes = param1["modes"];
         }
         if("mapModes" in param1)
         {
            this.mapModes = param1["mapModes"];
         }
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§) && Boolean(param1["mapModesFull"]))
         {
            this.mapModes = !this.mapModes ? param1["mapModesFull"] : this.mapModes.concat(param1["mapModesFull"]);
         }
         this.§_-L1j§ = this.modes != null && this.modes.length > 1;
         this.§_-F2e§ = this.mapModes != null && this.mapModes.length > 1;
      }
   }
}

