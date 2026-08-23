package §_-j2H§
{
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2World;
   import §_-I2Y§.§_-l2r§;
   import §_-TK§.§_-aS§;
   import §_-td§.§_-vO§;
   import flash.utils.getTimer;
   import game.mainGame.SquirrelGame;
   import game.mainGame.§_-3l§;
   import game.mainGame.§_-F1c§;
   import game.mainGame.§_-Q2d§;
   import game.mainGame.§_-s1V§;
   import game.mainGame.entity.§_-xn§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class ScriptedTimer extends §_-aS§ implements §_-xn§, §_-Q2d§, §_-F1c§, §_-3l§, §_-l2r§
   {
      
      private static const §_-qF§:int = 0;
      
      private static const §_-r2p§:int = 1;
      
      private var §_-u2w§:int;
      
      private var §_-32u§:Boolean = false;
      
      private var §_-Rr§:Boolean = false;
      
      private var §_-P1Y§:int = -1;
      
      private var §_-21H§:SquirrelGame;
      
      private var §_-g2Q§:Boolean = true;
      
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
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.draw();
      }
      
      public function build(param1:b2World) : void
      {
         this.visible = false;
         this.§_-21H§ = param1.userData as SquirrelGame;
         this.§_-Rr§ = this.§_-21H§ is §_-vO§;
         this.§_-P1Y§ = this.§_-21H§ != null && this.§_-21H§.map != null ? this.§_-21H§.map.§_-923§(this) : -1;
         this.§_-u2w§ = getTimer();
         this.§_-32u§ = true;
      }
      
      public function §_-m1Y§() : *
      {
         return [[this.tickScript,this.completeScript,this.running,this.delay,this.repeatCount,this.currentCount,this.onTickEnabled,this.onCompleteEnabled,[this.position.x,this.position.y],this.haxeScript]];
      }
      
      public function §_-o2I§(param1:*) : void
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
         if(this.§_-P1Y§ >= 0)
         {
            return this.§_-P1Y§;
         }
         if(this.§_-21H§ == null || this.§_-21H§.map == null)
         {
            return -1;
         }
         return this.§_-21H§.map.§_-923§(this);
      }
      
      public function §_-43w§(param1:String, param2:Boolean = false) : void
      {
         this.§_-h1f§(param1 == this.tickScript ? §_-qF§ : §_-r2p§,param2);
      }
      
      public function set showDebug(param1:Boolean) : void
      {
         this.visible = param1;
      }
      
      public function dispose() : void
      {
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         if(parentStarling)
         {
            parentStarling.removeChildStarling(this);
         }
         while(this.numChildren > 0)
         {
            §_-av§(0);
         }
         this.§_-21H§ = null;
         this.§_-32u§ = false;
         removeFromParent(true);
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!this.§_-32u§ || !this.§_-g2Q§ || this.delay <= 0)
         {
            return;
         }
         var _loc2_:int = getTimer();
         if(_loc2_ - this.§_-u2w§ <= this.delay)
         {
            return;
         }
         var _loc3_:Boolean = this.§_-21H§.scriptUtils.§_-v1f§;
         if(this.onTickEnabled && _loc3_)
         {
            this.§_-h1f§(§_-qF§);
         }
         this.§_-u2w§ = _loc2_;
         if(this.repeatCount <= 0)
         {
            this.reset();
            this.§_-g2Q§ = true;
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
               this.§_-h1f§(§_-r2p§);
            }
            this.running = false;
         }
      }
      
      public function set running(param1:Boolean) : void
      {
         if(this.§_-g2Q§ == param1)
         {
            return;
         }
         this.§_-g2Q§ = param1;
         this.§_-u2w§ = getTimer();
      }
      
      public function get running() : Boolean
      {
         return this.§_-g2Q§;
      }
      
      public function reset() : void
      {
         this.currentCount = 0;
         this.§_-u2w§ = getTimer();
      }
      
      public function get position() : b2Vec2
      {
         return new b2Vec2(this.x / Game.§_-12A§,this.y / Game.§_-12A§);
      }
      
      public function set position(param1:b2Vec2) : void
      {
         this.x = param1.x * Game.§_-12A§;
         this.y = param1.y * Game.§_-12A§;
      }
      
      public function get angle() : Number
      {
         return 0;
      }
      
      public function set angle(param1:Number) : void
      {
      }
      
      private function §_-h1f§(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:String = param1 == §_-qF§ ? this.tickScript : this.completeScript;
         if(!_loc3_)
         {
            return;
         }
         if(!this.§_-Rr§ || param2)
         {
            this.§_-21H§.scriptUtils.execute(_loc3_,this,{},this.haxeScript ? §_-s1V§.HAXE_SCRIPT : §_-s1V§.LUA_SCRIPT);
            return;
         }
         if(!this.§_-21H§.scriptUtils.§_-v1f§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"ScriptedTimer":[this.§_-P1Y§,param1]}));
      }
      
      private function draw() : void
      {
         this.visible = false;
         var _loc1_:§_-aS§ = new §_-aS§(new ScriptedTimerIcon());
         _loc1_.x = -_loc1_.width * 0.5;
         _loc1_.y = -_loc1_.height * 0.5;
         §_-J2J§(_loc1_);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Array = _loc2_["ScriptedTimer"];
         if(!_loc3_ || _loc3_[0] != this.§_-P1Y§)
         {
            return;
         }
         this.§_-h1f§(int(_loc3_[1]),true);
      }
   }
}

