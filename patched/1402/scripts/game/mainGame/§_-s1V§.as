package game.mainGame
{
   import Box2D.Common.Math.b2Vec2;
   import §_-5P§.§_-H2l§;
   import §_-I2Y§.§_-l2r§;
   import §_-bN§.§_-Fk§;
   import §_-c2C§.§_-H1k§;
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-fx§;
   import §_-n1h§.Perk;
   import §_-td§.GameMapNet;
   import events.§_-X8§;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import game.mainGame.entity.§_-f1b§;
   import game.mainGame.entity.§_-xn§;
   import hscript.§_-w2M§;
   import luaAlchemy.LuaAlchemy;
   import utils.§_-33I§;
   
   public class §_-s1V§ implements §_-l2r§
   {
      
      public static const LUA_SCRIPT:String = "LUA_SCRIPT";
      
      public static const HAXE_SCRIPT:String = "HAXE_SCRIPT";
      
      private var game:SquirrelGame;
      
      private var §_-Kl§:LuaAlchemy;
      
      public function §_-s1V§(param1:SquirrelGame)
      {
         super();
         this.game = param1;
         this.§_-Kl§ = param1.§_-2Q§;
         this.§_-G1G§();
      }
      
      public function dispose() : void
      {
         this.game = null;
         this.§_-Kl§.setGlobal("addObject",null);
         this.§_-Kl§.setGlobal("addObjectVec",null);
         this.§_-Kl§.setGlobal("getObject",null);
         this.§_-Kl§.setGlobal("getPosition",null);
         this.§_-Kl§.setGlobal("setPosition",null);
         this.§_-Kl§.setGlobal("setPositionVec",null);
         this.§_-Kl§.setGlobal("getObjectId",null);
         this.§_-Kl§.setGlobal("getObjectTypeName",null);
         this.§_-Kl§.setGlobal("getAngle",null);
         this.§_-Kl§.setGlobal("setAngle",null);
         this.§_-Kl§.setGlobal("build",null);
         this.§_-Kl§.setGlobal("vector",null);
         this.§_-Kl§.close();
         this.§_-Kl§ = null;
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
            this.§_-Kl§.setGlobal("this",self);
            this.§_-Kl§.setGlobal("Analytics",Analytics);
            for(key in vars)
            {
               this.§_-Kl§.setGlobal(key,vars[key]);
            }
            output = this.§_-Kl§.doString(script);
            if(!output[0] && §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§))
            {
               new §_-Fk§(gls("Ошибка скрипта в объекте\n{0}",self.name),"\n" + output.join("\n")).show();
            }
            this.§_-Kl§.setGlobal("this",null);
            for(key in vars)
            {
               this.§_-Kl§.setGlobal(key,null);
            }
            return;
         }
         if(scriptLanguage == HAXE_SCRIPT)
         {
            vars["self"] = self;
            vars["Analytics"] = Analytics;
            vars = this.§_-C1A§(vars);
            try
            {
               if(script.indexOf("Type.resolveClass") != -1)
               {
                  new §_-Fk§(gls("Ошибка скрипта в объекте\n{0}",self.name),gls("Скрипт содержит потенциально вредоносное содержимое.")).show();
                  §_-p2U§.add("HARMFUL SCRIPT: \'" + script + "\'");
                  return;
               }
               §_-w2M§.§_-71e§(script,vars);
            }
            catch(e:Error)
            {
               if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-m12§))
               {
                  new §_-Fk§(gls("Ошибка скрипта в объекте\n{0}",self.name),"\n" + e.message);
               }
            }
         }
      }
      
      public function get §_-v1f§() : Boolean
      {
         if(!(this.game.map is GameMapNet))
         {
            return true;
         }
         return (this.game.map as GameMapNet).§_-u1m§.§_-Ca§ || this.game.squirrels.isSynchronizing;
      }
      
      private function §_-C1A§(param1:Object) : Object
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
         _loc2_["P2M"] = Game.§_-12A§;
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
      
      private function §_-G1G§() : void
      {
         this.§_-Kl§.setGlobal("removeObject",this.removeObject);
         this.§_-Kl§.setGlobal("addObject",this.addObject);
         this.§_-Kl§.setGlobal("addObjectVec",this.addObjectVec);
         this.§_-Kl§.setGlobal("getPosition",this.getPosition);
         this.§_-Kl§.setGlobal("setPosition",this.setPosition);
         this.§_-Kl§.setGlobal("setPositionVec",this.setPositionVec);
         this.§_-Kl§.setGlobal("getObject",this.getObject);
         this.§_-Kl§.setGlobal("getObjectId",this.getObjectId);
         this.§_-Kl§.setGlobal("getObjectTypeName",this.getObjectTypeName);
         this.§_-Kl§.setGlobal("getAngle",this.getAngle);
         this.§_-Kl§.setGlobal("setAngle",this.setAngle);
         this.§_-Kl§.setGlobal("showMessage",this.showMessage);
         this.§_-Kl§.setGlobal("allowPerk",this.allowPerk);
         this.§_-Kl§.setGlobal("build",this.build);
         this.§_-Kl§.setGlobal("vector",this.vector);
         this.§_-Kl§.setGlobal("createSquirrel",this.createSquirrel);
         this.§_-Kl§.setGlobal("createShaman",this.createShaman);
         this.§_-Kl§.setGlobal("getSquirrel",this.getSquirrel);
         this.§_-Kl§.setGlobal("killSquirrel",this.killSquirrel);
         this.§_-Kl§.setGlobal("addHintArrow",this.addHintArrow);
         this.§_-Kl§.setGlobal("removeHintArrow",this.removeHintArrow);
         this.§_-Kl§.setGlobal("dispatch",this.dispatch);
         this.§_-Kl§.setGlobal("setGlobal",this.§_-Kl§.setGlobal);
         this.§_-Kl§.setGlobal("P2M",Game.§_-12A§);
         this.§_-Kl§.setGlobal("PI",Math.PI);
      }
      
      private function showMessage(param1:String, param2:String) : void
      {
         new §_-Fk§(param1,param2).show();
      }
      
      private function removeObject(param1:*) : void
      {
         this.game.map.removeObject(param1);
      }
      
      public function allowPerk(param1:int, param2:Boolean, param3:Boolean = false) : void
      {
         var _loc4_:§_-H2l§ = null;
         if(param2)
         {
            §_-H1k§.§_-t1y§[param1] = true;
            if(!param3)
            {
               §_-S2E§.§_-t1y§[param1] = true;
               §_-fx§.§_-t1y§[param1] = true;
            }
         }
         else
         {
            delete §_-H1k§.§_-t1y§[param1];
            delete §_-S2E§.§_-t1y§[param1];
            delete §_-fx§.§_-t1y§[param1];
         }
         if(Boolean(Hero.self) && Boolean(Hero.self.perkController))
         {
            for each(_loc4_ in Hero.self.perkController.§_-rI§)
            {
               if(_loc4_.§_-T2a§ == param1)
               {
                  _loc4_.dispatchEvent(new Event(Perk.§_-E1b§));
                  break;
               }
            }
         }
      }
      
      private function createSquirrel(param1:int, param2:Number, param3:Number) : Hero
      {
         this.game.squirrels.add(param1);
         this.game.squirrels.get(param1).position = new b2Vec2(param2 / Game.§_-12A§,param3 / Game.§_-12A§);
         this.game.squirrels.get(param1).§_-21b§(null);
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
         this.game.squirrels.get(param1).§_-kl§();
      }
      
      private function addObject(param1:*, param2:Number, param3:Number, param4:Number, param5:Boolean = true) : §_-xn§
      {
         return this.game.map.addObject(param1,param2,param3,param4,param5);
      }
      
      private function addObjectVec(param1:*, param2:b2Vec2, param3:Number, param4:Boolean = true) : §_-xn§
      {
         return this.game.map.addObject(param1,param2.x,param2.y,param3,param4);
      }
      
      private function getObject(param1:String) : §_-xn§
      {
         if(this.game == null || this.game.map == null)
         {
            return null;
         }
         return this.game.map.§_-br§(param1);
      }
      
      private function getPosition(param1:String) : b2Vec2
      {
         var _loc2_:b2Vec2 = this.getObject(param1).position.Copy();
         _loc2_.Multiply(Game.§_-12A§);
         return _loc2_;
      }
      
      private function setPosition(param1:String, param2:Number, param3:Number, param4:Boolean = true) : void
      {
         if(param4)
         {
            setTimeout(this.setPosition,0,param1,param2,param3,false);
         }
         var _loc5_:§_-xn§ = this.getObject(param1);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:b2Vec2 = new b2Vec2(param2,param3);
         _loc6_.Multiply(1 / Game.§_-12A§);
         _loc5_.position = _loc6_;
      }
      
      private function setPositionVec(param1:String, param2:b2Vec2, param3:Boolean = true) : void
      {
         if(param3)
         {
            setTimeout(this.setPositionVec,0,param1,param2,false);
         }
         var _loc4_:b2Vec2 = param2.Copy();
         _loc4_.Multiply(1 / Game.§_-12A§);
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
      
      private function getObjectId(param1:§_-xn§) : int
      {
         return §_-f1b§.§_-q2W§(param1);
      }
      
      private function getObjectTypeName(param1:§_-xn§) : String
      {
         return §_-f1b§.getName(param1);
      }
      
      private function build(param1:§_-xn§) : void
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
         this.game.dispatchEvent(new §_-X8§(param1));
      }
   }
}

