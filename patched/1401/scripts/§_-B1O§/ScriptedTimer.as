package §_-B1O§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-A2x§.§_-Ar§;
   import §_-RI§.§_-h2I§;
   import §_-Y22§.§_-C2x§;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-03u§;
   import game.mainGame.§_-8B§;
   import game.mainGame.§_-Tm§;
   import game.mainGame.§_-s2a§;
   import game.mainGame.entity.§_-63Q§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class ScriptedTimer extends §_-h2I§ implements §_-63Q§, §_-8B§, §_-Tm§, §_-03u§, §_-C2x§
   {
      
      private static const §_-g2R§:int = 0;
      
      private static const §_-t2a§:int = 1;
      
      private var §_-G1i§:int;
      
      private var §_-m1I§:Boolean = false;
      
      private var §_-I1w§:Boolean = false;
      
      private var §_-Q1q§:int = -1;
      
      private var §_-H2D§:SquirrelGame;
      
      private var §_-q1Q§:Boolean = true;
      
      public var onTickEnabled:Boolean = true;
      
      public var tickScript:String = "";
      
      public var onCompleteEnabled:Boolean = true;
      
      public var completeScript:String = "";
      
      public var delay:int = 0;
      
      public var repeatCount:int = 0;
      
      public var currentCount:int = 0;
      
      public var haxeScript:Boolean = false;
      
      public function ScriptedTimer()
      {
         super();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         this.draw();
      }
      
      public function build(param1:b2World) : void
      {
         this.visible = false;
         this.§_-H2D§ = param1.userData as SquirrelGame;
         this.§_-I1w§ = this.§_-H2D§ is §_-Ar§;
         this.§_-Q1q§ = this.§_-H2D§ != null && this.§_-H2D§.map != null ? this.§_-H2D§.map.§_-F2W§(this) : -1;
         this.§_-G1i§ = getTimer();
         this.§_-m1I§ = true;
      }
      
      public function §_-A1X§() : *
      {
         return [[this.tickScript,this.completeScript,this.running,this.delay,this.repeatCount,this.currentCount,this.onTickEnabled,this.onCompleteEnabled,[this.position.x,this.position.y],this.haxeScript]];
      }
      
      public function §_-41M§(param1:*) : void
      {
         var _loc2_:Array = param1[0];
         this.tickScript = _loc2_[0];
         this.completeScript = _loc2_[1];
         this.running = Boolean(_loc2_[2]);
         this.delay = _loc2_[3];
         this.repeatCount = _loc2_[4];
         this.currentCount = _loc2_[5];
         this.onTickEnabled = Boolean(_loc2_[6]);
         this.onCompleteEnabled = Boolean(_loc2_[7]);
         this.position = new b2Vec2(_loc2_[8][0],_loc2_[8][1]);
         if("9" in _loc2_)
         {
            this.haxeScript = Boolean(_loc2_[9]);
         }
      }
      
      public function get id() : int
      {
         if(this.§_-Q1q§ >= 0)
         {
            return this.§_-Q1q§;
         }
         if(this.§_-H2D§ == null || this.§_-H2D§.map == null)
         {
            return -1;
         }
         return this.§_-H2D§.map.§_-F2W§(this);
      }
      
      public function §_-l1j§(param1:String, param2:Boolean = false) : void
      {
         this.§_-D2X§(param1 == this.tickScript ? §_-g2R§ : §_-t2a§,param2);
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.visible = param1;
      }
      
      public function dispose() : void
      {
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         if(parentStarling)
         {
            parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            §_-n2T§(0);
         }
         this.§_-H2D§ = null;
         this.§_-m1I§ = false;
         removeFromParent(true);
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.§_-m1I§ || !this.§_-q1Q§ || this.delay <= 0)
         {
            return;
         }
         var _loc2_:int = getTimer();
         if(_loc2_ - this.§_-G1i§ <= this.delay)
         {
            return;
         }
         var _loc3_:Boolean = this.§_-H2D§.scriptUtils.§_-Q6§;
         if(this.onTickEnabled && _loc3_)
         {
            this.§_-D2X§(§_-g2R§);
         }
         this.§_-G1i§ = _loc2_;
         if(this.repeatCount <= 0)
         {
            this.reset();
            this.§_-q1Q§ = true;
            return;
         }
         ++this.currentCount;
         if(this.currentCount < this.repeatCount)
         {
            return;
         }
         if(this.onCompleteEnabled)
         {
            if(_loc3_)
            {
               this.§_-D2X§(§_-t2a§);
            }
            this.running = false;
         }
      }
      
      public function set running(param1:Boolean) : void
      {
         if(this.§_-q1Q§ == param1)
         {
            return;
         }
         this.§_-q1Q§ = param1;
         this.§_-G1i§ = getTimer();
      }
      
      public function get running() : Boolean
      {
         return this.§_-q1Q§;
      }
      
      public function reset() : void
      {
         this.currentCount = 0;
         this.§_-G1i§ = getTimer();
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-x2P§,this.y / Game.§_-x2P§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-x2P§;
         this.y = param1.y * Game.§_-x2P§;
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      private function §_-D2X§(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:String = param1 == §_-g2R§ ? this.tickScript : this.completeScript;
         if(!_loc3_)
         {
            return;
         }
         if(!this.§_-I1w§ || param2)
         {
            this.§_-H2D§.scriptUtils.execute(_loc3_,this,{},this.haxeScript ? §_-s2a§.HAXE_SCRIPT : §_-s2a§.LUA_SCRIPT);
            return;
         }
         if(!this.§_-H2D§.scriptUtils.§_-Q6§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"ScriptedTimer":[this.§_-Q1q§,param1]}));
      }
      
      private function draw() : void
      {
         this.visible = false;
         var _loc1_:§_-h2I§ = new §_-h2I§(new ScriptedTimerIcon());
         _loc1_.x = -_loc1_.width * 0.5;
         _loc1_.y = -_loc1_.height * 0.5;
         §_-83v§(_loc1_);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Array = _loc2_["ScriptedTimer"];
         if(!_loc3_ || _loc3_[0] != this.§_-Q1q§)
         {
            return;
         }
         this.§_-D2X§(int(_loc3_[1]),true);
      }
   }
}

