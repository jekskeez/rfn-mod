package game.mainGame
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-1T§.DisplayObjectManager;
   import §_-B1O§.§_-O1q§;
   import §_-RI§.§_-h2I§;
   import §_-T2y§.§_-92z§;
   import §_-k1c§.Dialog;
   import chat.§_-A1n§;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   import luaAlchemy.LuaAlchemy;
   import protocol.§_-S2I§;
   import utils.§_-vS§;
   
   public class SquirrelGame extends §_-h2I§
   {
      
      public static const §_-DF§:Number = 0.8;
      
      private static const §_-g2v§:Number = 0.016666666666666666;
      
      private static const §_-B3p§:int = 8;
      
      private static const §_-P2X§:int = 3;
      
      private static const §_-o2v§:Boolean = true;
      
      private static const §_-i2i§:Number = 0.9;
      
      public static const §_-h1O§:b2Vec2 = new b2Vec2(0,100);
      
      protected static var §_-93L§:Dialog = null;
      
      private static var _instance:SquirrelGame = null;
      
      public var world:b2World = new b2World(§_-h1O§,true);
      
      public var map:GameMap;
      
      public var squirrels:SquirrelCollection;
      
      public var cast:Cast;
      
      public var camera:§_-415§;
      
      public var §_-A3o§:§_-j2x§;
      
      public var §_-a1w§:LuaAlchemy = new LuaAlchemy();
      
      public var §_-614§:§_-d2h§ = new §_-d2h§();
      
      public var §_-3O§:§_-h2I§ = new §_-h2I§();
      
      public var §_-i2k§:§_-O1q§ = new §_-O1q§();
      
      public var §_-G2k§:Number = 0.9;
      
      protected var §_-M1K§:Boolean = false;
      
      protected var §_-s2Y§:DisplayObjectContainer = null;
      
      private var §_-B2n§:§_-gp§ = new §_-gp§();
      
      private var §_-j23§:Boolean = false;
      
      private var §_-rg§:int;
      
      private var §_-12j§:Number = 0;
      
      private var §_-G28§:§_-s2a§ = null;
      
      private var §_-g1y§:Object = {};
      
      public function SquirrelGame()
      {
         _instance = this;
         §_-TQ§.add("SquirrelGame.SquirrelGame");
         super();
         §_-vS§.§_-41D§(this);
         this.world.userData = this;
         this.§_-3O§.mouseEnabled = false;
         this.§_-3O§.mouseChildren = false;
         addChild(this.map);
         §_-83v§(this.squirrels);
         addChild(this.squirrels);
         §_-83v§(this.map.§_-P2y§);
         this.§_-i2k§.visible = false;
         §_-83v§(this.§_-i2k§);
         if(this.cast)
         {
            §_-83v§(this.cast);
         }
         this.world.SetContactListener(new §_-Ht§(this.world));
         this.world.SetContactFilter(this.§_-614§);
         this.camera = new §_-415§(this);
         this.§_-A3o§ = new §_-j2x§(this.map);
         §_-83v§(this.§_-A3o§);
         this.§_-G28§ = new §_-s2a§(this);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
         this.§_-A3q§();
      }
      
      public static function get instance() : SquirrelGame
      {
         return _instance;
      }
      
      public function §_-W2H§() : Boolean
      {
         this.§_-B2n§.§_-813§ = this.§_-s2Y§;
         return this.§_-B2n§.§_-W2H§();
      }
      
      public function §_-a2S§(param1:Point) : Boolean
      {
         this.§_-B2n§.§_-813§ = this.§_-s2Y§;
         return this.§_-B2n§.§_-Q1B§(param1);
      }
      
      public function get §_-1q§() : Boolean
      {
         return this.§_-i2k§.visible;
      }
      
      public function set §_-1q§(param1:Boolean) : void
      {
         if(this.§_-i2k§.visible == param1)
         {
            return;
         }
         this.§_-i2k§.visible = param1;
      }
      
      public function get scriptUtils() : §_-s2a§
      {
         if(!this.§_-G28§)
         {
            §_-TQ§.add("Init LuaAlchemy");
            this.§_-a1w§ = new LuaAlchemy();
            this.§_-G28§ = new §_-s2a§(this);
         }
         return this.§_-G28§;
      }
      
      public function §_-vw§() : void
      {
         if(!§_-93L§)
         {
            return;
         }
         if(§_-93L§.visible)
         {
            §_-93L§.hide();
         }
         else
         {
            §_-93L§.show();
         }
      }
      
      public function round(param1:Array) : void
      {
         if(Game.activated)
         {
            while(true)
            {
               if(Game.state != 7)
               {
                  if(Game.state != 8)
                  {
                     if(Game.state != 9)
                     {
                        if(Game.state != 11)
                        {
                           break;
                        }
                     }
                  }
               }
               Game.state = 12;
               Game.time = getTimer();
               Game.target = null;
               §_-92z§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 22 секунды.",§_-A1n§.§_-N1c§);
               break;
            }
         }
         if(Game.activated)
         {
            while(true)
            {
               if(Game.state != 7)
               {
                  if(Game.state != 8)
                  {
                     if(Game.state != 9)
                     {
                        if(Game.state != 11)
                        {
                           break;
                        }
                     }
                  }
               }
               Game.state = 1;
               Game.time = getTimer();
               Game.target = null;
               §_-92z§.sendMessage(Game.selfId,"Новый раунд. Автосбор через 10 секунд.",§_-A1n§.§_-N1c§);
               break;
            }
         }
         this.cast.round(param1);
         this.map.round(param1);
         this.squirrels.round(param1);
         if(§_-93L§ != null)
         {
            if(param1[0] == §_-S2I§.§_-RO§)
            {
               §_-93L§.show();
            }
            else
            {
               §_-93L§.hide();
            }
         }
         this.§_-si§();
      }
      
      public function get gravity() : b2Vec2
      {
         return this.world.GetGravity();
      }
      
      public function set gravity(param1:b2Vec2) : void
      {
         this.world.SetGravity(param1);
      }
      
      public function set shift(param1:Point) : void
      {
         if(int(param1.x) != this.map.x || int(param1.y) != this.map.y)
         {
            this.squirrels.x = this.map.§_-P2y§.x = int(param1.x);
            this.squirrels.y = this.map.§_-P2y§.y = int(param1.y);
            this.map.shift = param1;
            this.§_-i2k§.§_-x1T§ = new Point(this.map.x,this.map.y);
         }
         this.§_-91L§();
      }
      
      public function §_-91L§() : void
      {
         if(!this.cast)
         {
            return;
         }
         this.cast.x = int(this.map.x);
         this.cast.y = int(this.map.y);
      }
      
      public function get shift() : Point
      {
         return new Point(this.map.x,this.map.y);
      }
      
      public function get §_-j1L§() : Boolean
      {
         return this.§_-M1K§;
      }
      
      public function set §_-j1L§(param1:Boolean) : void
      {
         if(this.§_-M1K§ == param1)
         {
            return;
         }
         this.§_-M1K§ = param1;
         if(!param1)
         {
            §_-01Y§.§_-t1s§(this.onUpdate);
            return;
         }
         this.paused = false;
         this.§_-rg§ = getTimer();
         this.§_-12j§ = 0;
         §_-01Y§.§_-h1R§(this.onUpdate);
         this.map.build(this.world);
      }
      
      public function get paused() : Boolean
      {
         return this.§_-j23§;
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(this.§_-j23§ == param1)
         {
            return;
         }
         this.§_-j23§ = param1;
      }
      
      public function addHintArrow(param1:String, param2:Point, param3:Number) : void
      {
         if(param1 in this.§_-g1y§)
         {
            return;
         }
         var _loc4_:ArrowMovie = new ArrowMovie();
         _loc4_.x = param2.x - 13;
         _loc4_.y = param2.y;
         _loc4_.rotation = (param3 - 90) / Game.D2R;
         if(contains(_loc4_))
         {
            return;
         }
         addChild(_loc4_);
         this.§_-g1y§[param1] = _loc4_;
      }
      
      public function removeHintArrow(param1:String) : void
      {
         if(!(param1 in this.§_-g1y§))
         {
            return;
         }
         removeChild(this.§_-g1y§[param1]);
         this.§_-g1y§[param1] = null;
         delete this.§_-g1y§[param1];
      }
      
      public function §_-si§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in this.§_-g1y§)
         {
            this.removeHintArrow(_loc1_);
         }
      }
      
      public function dispose() : void
      {
         if(Game.activated)
         {
            if(Hero.self != null)
            {
               Hero.self.immortal = Game.immortal;
            }
            Game.activated = false;
            Game.state = 0;
            Game.target = null;
         }
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-A3q§);
         §_-TQ§.add("SquirrelGame.dispose");
         §_-vS§.§_-324§(this);
         this.map.dispose();
         this.map = null;
         §_-TQ§.add("SquirrelGame.cast");
         if(this.cast)
         {
            this.cast.dispose();
         }
         this.cast = null;
         §_-TQ§.add("SquirrelGame.squirrels");
         if(this.squirrels != null)
         {
            this.squirrels.dispose();
         }
         this.squirrels = null;
         this.§_-i2k§.dispose();
         this.§_-i2k§ = null;
         §_-TQ§.add("SquirrelGame.world");
         this.world.SetDestructionListener(null);
         this.world.SetContactListener(null);
         this.world.userData = null;
         this.§_-j1L§ = false;
         this.world = null;
         §_-TQ§.add("SquirrelGame.removeChild");
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         §_-TQ§.add("SquirrelGame.scriptUtils");
         if(this.§_-G28§)
         {
            this.§_-G28§.dispose();
         }
         §_-TQ§.add("SquirrelGame.script");
         if(this.§_-a1w§)
         {
            this.§_-a1w§.close();
         }
         this.§_-G28§ = null;
         this.§_-a1w§ = null;
         §_-TQ§.add("SquirrelGame.sideIcon");
         if(this.§_-A3o§)
         {
            this.§_-A3o§.dispose();
         }
         this.§_-A3o§ = null;
         §_-TQ§.add("SquirrelGame.camera");
         if(this.camera)
         {
            this.camera.dispose();
         }
         this.camera = null;
         this.§_-614§ = null;
         §_-TQ§.add("SquirrelGame.DisplayObjectManager.disposeExcess()");
         DisplayObjectManager.getInstance().§_-z2X§();
         if(§_-93L§)
         {
            §_-93L§.hide();
         }
         if(_instance == this)
         {
            _instance = null;
         }
      }
      
      public function update(param1:Number) : void
      {
         var simulateTimeStep:Number;
         var timeStep:Number = param1;
         if(!this.§_-j1L§)
         {
            return;
         }
         if(this.paused)
         {
            this.§_-12j§ = 0;
            return;
         }
         this.§_-12j§ += timeStep;
         simulateTimeStep = §_-o2v§ ? §_-g2v§ / this.§_-G2k§ : this.§_-12j§;
         while(this.§_-12j§ >= simulateTimeStep)
         {
            try
            {
               this.world.Step(simulateTimeStep * this.§_-G2k§,§_-B3p§,§_-P2X§);
               this.squirrels.update(simulateTimeStep);
               this.§_-12j§ -= simulateTimeStep;
               this.world.ClearForces();
            }
            catch(e:Error)
            {
               §_-TQ§.add("SquirrelGame->update: " + e.message);
            }
         }
         this.map.update(timeStep);
         if(this.cast)
         {
            this.cast.update(timeStep);
         }
         this.camera.update();
         if(this.§_-1q§)
         {
            this.§_-i2k§.update();
         }
      }
      
      public function onError() : void
      {
      }
      
      private function §_-A3q§(param1:Event = null) : void
      {
         if(this.§_-A3o§)
         {
            this.§_-A3o§.§_-z2R§ = new Rectangle(0,40,GameMap.§_-q1n§,GameMap.§_-P1Q§ - 40);
         }
         if(this.map)
         {
            this.shift = this.shift;
         }
      }
      
      private function onUpdate() : void
      {
         var _loc1_:Number = getTimer();
         var _loc2_:Number = (_loc1_ - this.§_-rg§) * 0.001;
         this.§_-rg§ = _loc1_;
         this.update(_loc2_);
      }
   }
}

