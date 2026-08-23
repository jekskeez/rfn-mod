package game.mainGame
{
   import Box2D.Common.Math.b2Vec2;
   import §_-1§.§_-K19§;
   import §_-A2x§.GameMapNet;
   import §_-S2§.Perk;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-P1Y§;
   import §_-T2y§.§_-w17§;
   import §_-Y22§.§_-C2x§;
   import §_-k1c§.§_-Q13§;
   import events.§_-03Q§;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-03s§;
   import game.mainGame.entity.§_-63Q§;
   import hscript.§_-02Y§;
   import luaAlchemy.LuaAlchemy;
   import utils.§_-c10§;
   
   public class §_-s2a§ implements §_-C2x§
   {
      
      public static const LUA_SCRIPT:String = "LUA_SCRIPT";
      
      public static const HAXE_SCRIPT:String = "HAXE_SCRIPT";
      
      private var game:SquirrelGame;
      
      private var §_-71i§:LuaAlchemy;
      
      public function §_-s2a§(param1:SquirrelGame)
      {
         super();
         this.game = param1;
         this.§_-71i§ = param1.§_-a1w§;
         this.§_-O2T§();
      }
      
      public function dispose() : void
      {
         this.game = null;
         this.§_-71i§.setGlobal("addObject",null);
         this.§_-71i§.setGlobal("addObjectVec",null);
         this.§_-71i§.setGlobal("getObject",null);
         this.§_-71i§.setGlobal("getPosition",null);
         this.§_-71i§.setGlobal("setPosition",null);
         this.§_-71i§.setGlobal("setPositionVec",null);
         this.§_-71i§.setGlobal("getObjectId",null);
         this.§_-71i§.setGlobal("getObjectTypeName",null);
         this.§_-71i§.setGlobal("getAngle",null);
         this.§_-71i§.setGlobal("setAngle",null);
         this.§_-71i§.setGlobal("build",null);
         this.§_-71i§.setGlobal("vector",null);
         this.§_-71i§.close();
         this.§_-71i§ = null;
      }
      
      public function execute(param1:String, param2:*, param3:Object, param4:String = "LUA_SCRIPT") : void
      {
         var key:String = null;
         var output:Array = null;
         var script:String = param1;
         var self:* = param2;
         var vars:Object = param3;
         var scriptLanguage:String = param4;
         if(scriptLanguage == LUA_SCRIPT)
         {
            this.§_-71i§.setGlobal("this",self);
            this.§_-71i§.setGlobal("Analytics",Analytics);
            for(key in vars)
            {
               this.§_-71i§.setGlobal(key,vars[key]);
            }
            output = this.§_-71i§.doString(script);
            if(!output[0] && §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§))
            {
               new §_-Q13§(gls("Ошибка скрипта в объекте\n{0}",self.name),"\n" + output.join("\n")).show();
            }
            this.§_-71i§.setGlobal("this",null);
            for(key in vars)
            {
               this.§_-71i§.setGlobal(key,null);
            }
            return;
         }
         if(scriptLanguage == HAXE_SCRIPT)
         {
            vars["self"] = self;
            vars["Analytics"] = Analytics;
            vars = this.§_-Gc§(vars);
            try
            {
               if(script.indexOf("Type.resolveClass") != -1)
               {
                  new §_-Q13§(gls("Ошибка скрипта в объекте\n{0}",self.name),gls("Скрипт содержит потенциально вредоносное содержимое.")).show();
                  §_-TQ§.add("HARMFUL SCRIPT: \'" + script + "\'");
                  return;
               }
               §_-02Y§.§_-S1m§(script,vars);
            }
            catch(e:Error)
            {
               if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-N1O§))
               {
                  new §_-Q13§(gls("Ошибка скрипта в объекте\n{0}",self.name),"\n" + e.message);
               }
            }
         }
      }
      
      public function get §_-Q6§() : Boolean
      {
         if(!(this.game.map is GameMapNet))
         {
            return true;
         }
         return (this.game.map as GameMapNet).§_-dJ§.§_-G1U§ || this.game.squirrels.isSynchronizing;
      }
      
      private function §_-Gc§(param1:Object) : Object
      {
         var _loc3_:String = null;
         var _loc2_:Object = {};
         _loc2_["removeObject"] = this.removeObject;
         _loc2_["addObject"] = this.addObject;
         _loc2_["addObjectVec"] = this.addObjectVec;
         _loc2_["getPosition"] = this.getPosition;
         _loc2_["setPosition"] = this.setPosition;
         _loc2_["setPositionVec"] = this.setPositionVec;
         _loc2_["getObject"] = this.getObject;
         _loc2_["getObjectId"] = this.getObjectId;
         _loc2_["getObjectTypeName"] = this.getObjectTypeName;
         _loc2_["getAngle"] = this.getAngle;
         _loc2_["setAngle"] = this.setAngle;
         _loc2_["showMessage"] = this.showMessage;
         _loc2_["allowPerk"] = this.allowPerk;
         _loc2_["build"] = this.build;
         _loc2_["vector"] = this.vector;
         _loc2_["createSquirrel"] = this.createSquirrel;
         _loc2_["createShaman"] = this.createShaman;
         _loc2_["getSquirrel"] = this.getSquirrel;
         _loc2_["killSquirrel"] = this.killSquirrel;
         _loc2_["addHintArrow"] = this.addHintArrow;
         _loc2_["removeHintArrow"] = this.removeHintArrow;
         _loc2_["dispatch"] = this.dispatch;
         _loc2_["P2M"] = Game.§_-x2P§;
         _loc2_["PI"] = Math.PI;
         _loc2_["R2D"] = Game.R2D;
         _loc2_["D2R"] = Game.D2R;
         _loc2_["b2Vec2"] = b2Vec2;
         for(_loc3_ in param1)
         {
            _loc2_[_loc3_] = param1[_loc3_];
         }
         return _loc2_;
      }
      
      private function §_-O2T§() : void
      {
         this.§_-71i§.setGlobal("removeObject",this.removeObject);
         this.§_-71i§.setGlobal("addObject",this.addObject);
         this.§_-71i§.setGlobal("addObjectVec",this.addObjectVec);
         this.§_-71i§.setGlobal("getPosition",this.getPosition);
         this.§_-71i§.setGlobal("setPosition",this.setPosition);
         this.§_-71i§.setGlobal("setPositionVec",this.setPositionVec);
         this.§_-71i§.setGlobal("getObject",this.getObject);
         this.§_-71i§.setGlobal("getObjectId",this.getObjectId);
         this.§_-71i§.setGlobal("getObjectTypeName",this.getObjectTypeName);
         this.§_-71i§.setGlobal("getAngle",this.getAngle);
         this.§_-71i§.setGlobal("setAngle",this.setAngle);
         this.§_-71i§.setGlobal("showMessage",this.showMessage);
         this.§_-71i§.setGlobal("allowPerk",this.allowPerk);
         this.§_-71i§.setGlobal("build",this.build);
         this.§_-71i§.setGlobal("vector",this.vector);
         this.§_-71i§.setGlobal("createSquirrel",this.createSquirrel);
         this.§_-71i§.setGlobal("createShaman",this.createShaman);
         this.§_-71i§.setGlobal("getSquirrel",this.getSquirrel);
         this.§_-71i§.setGlobal("killSquirrel",this.killSquirrel);
         this.§_-71i§.setGlobal("addHintArrow",this.addHintArrow);
         this.§_-71i§.setGlobal("removeHintArrow",this.removeHintArrow);
         this.§_-71i§.setGlobal("dispatch",this.dispatch);
         this.§_-71i§.setGlobal("setGlobal",this.§_-71i§.setGlobal);
         this.§_-71i§.setGlobal("P2M",Game.§_-x2P§);
         this.§_-71i§.setGlobal("PI",Math.PI);
      }
      
      private function showMessage(param1:String, param2:String) : void
      {
         new §_-Q13§(param1,param2).show();
      }
      
      private function removeObject(param1:*) : void
      {
         this.game.map.removeObject(param1);
      }
      
      public function allowPerk(param1:int, param2:Boolean, param3:Boolean = false) : void
      {
         var _loc4_:§_-K19§ = null;
         if(param2)
         {
            §_-P1Y§.§_-Vx§[param1] = true;
            if(!param3)
            {
               §_-F29§.§_-Vx§[param1] = true;
               §_-w17§.§_-Vx§[param1] = true;
            }
         }
         else
         {
            delete §_-P1Y§.§_-Vx§[param1];
            delete §_-F29§.§_-Vx§[param1];
            delete §_-w17§.§_-Vx§[param1];
         }
         if(Boolean(Hero.self) && Boolean(Hero.self.perkController))
         {
            for each(_loc4_ in Hero.self.perkController.§_-s13§)
            {
               if(_loc4_.§_-i2D§ == param1)
               {
                  _loc4_.dispatchEvent(new Event(Perk.§_-RK§));
                  break;
               }
            }
         }
      }
      
      private function createSquirrel(param1:int, param2:Number, param3:Number) : Hero
      {
         this.game.squirrels.add(param1);
         this.game.squirrels.get(param1).position = new b2Vec2(param2 / Game.§_-x2P§,param3 / Game.§_-x2P§);
         this.game.squirrels.get(param1).§_-T1T§(null);
         this.game.squirrels.get(param1).reset();
         this.game.squirrels.get(param1).show();
         return this.game.squirrels.get(param1);
      }
      
      private function createShaman(param1:int, param2:Number, param3:Number) : Hero
      {
         this.createSquirrel(param1,param2,param3).shaman = true;
         return this.game.squirrels.get(param1);
      }
      
      private function getSquirrel(param1:int) : Hero
      {
         return this.game.squirrels.get(param1);
      }
      
      private function killSquirrel(param1:int) : void
      {
         this.game.squirrels.get(param1).§_-h2r§();
      }
      
      private function addObject(param1:*, param2:Number, param3:Number, param4:Number, param5:Boolean = true) : §_-63Q§
      {
         return this.game.map.addObject(param1,param2,param3,param4,param5);
      }
      
      private function addObjectVec(param1:*, param2:b2Vec2, param3:Number, param4:Boolean = true) : §_-63Q§
      {
         return this.game.map.addObject(param1,param2.x,param2.y,param3,param4);
      }
      
      private function getObject(param1:String) : §_-63Q§
      {
         if(this.game == null || this.game.map == null)
         {
            return null;
         }
         return this.game.map.§_-xL§(param1);
      }
      
      private function getPosition(param1:String) : b2Vec2
      {
         var _loc2_:b2Vec2 = this.getObject(param1).position.Copy();
         _loc2_.Multiply(Game.§_-x2P§);
         return _loc2_;
      }
      
      private function setPosition(param1:String, param2:Number, param3:Number, param4:Boolean = true) : void
      {
         if(param4)
         {
            setTimeout(this.setPosition,0,param1,param2,param3,false);
         }
         var _loc5_:§_-63Q§ = this.getObject(param1);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:b2Vec2 = new b2Vec2(param2,param3);
         _loc6_.Multiply(1 / Game.§_-x2P§);
         _loc5_.position = _loc6_;
      }
      
      private function setPositionVec(param1:String, param2:b2Vec2, param3:Boolean = true) : void
      {
         if(param3)
         {
            setTimeout(this.setPositionVec,0,param1,param2,false);
         }
         var _loc4_:b2Vec2 = param2.Copy();
         _loc4_.Multiply(1 / Game.§_-x2P§);
         this.getObject(param1).position = _loc4_;
      }
      
      private function getAngle(param1:String) : Number
      {
         return this.getObject(param1).angle / Game.D2R;
      }
      
      private function setAngle(param1:String, param2:Number) : void
      {
         this.getObject(param1).angle = param2 * Game.D2R;
      }
      
      private function vector(param1:Number = 0, param2:Number = 0) : b2Vec2
      {
         return new b2Vec2(param1,param2);
      }
      
      private function getObjectId(param1:§_-63Q§) : int
      {
         return §_-03s§.§_-X21§(param1);
      }
      
      private function getObjectTypeName(param1:§_-63Q§) : String
      {
         return §_-03s§.getName(param1);
      }
      
      private function build(param1:§_-63Q§) : void
      {
         param1.build(this.game.world);
      }
      
      private function addHintArrow(param1:String, param2:Number, param3:Number, param4:Number) : void
      {
         this.game.addHintArrow(param1,new Point(param2,param3),param4);
      }
      
      private function removeHintArrow(param1:String) : void
      {
         this.game.removeHintArrow(param1);
      }
      
      private function dispatch(param1:int) : void
      {
         this.game.dispatchEvent(new §_-03Q§(param1));
      }
   }
}

