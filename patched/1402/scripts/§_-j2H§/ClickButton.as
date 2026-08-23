package §_-j2H§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Collision.b2Manifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2ContactImpulse;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-8Q§.GameBody;
   import §_-TK§.§_-aS§;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import §_-j4§.§_-Pn§;
   import §_-td§.§_-vO§;
   import flash.utils.Timer;
   import game.mainGame.§_-d7§;
   import game.mainGame.§_-s1V§;
   import game.mainGame.entity.§_-41O§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import starling.display.Button;
   import starling.display.§_-s11§;
   import starling.filters.BlurFilter;
   
   public class ClickButton extends GameBody implements §_-Pn§, §_-41O§, §_-d7§
   {
      
      private static const §_-CT§:int = 0;
      
      private static const §_-81p§:int = 0;
      
      private static const §_-V2H§:uint = 2;
      
      private var §_-y1d§:b2Vec2 = new b2Vec2(§_-V2H§,§_-V2H§);
      
      private var world:b2World;
      
      private var §_-018§:Array = [];
      
      private var §_-cf§:Boolean = false;
      
      private var §_-c2R§:int = 2000;
      
      private var _toggle:Boolean;
      
      private var downState:§_-aS§ = new §_-aS§(new ClickButtonDown());
      
      private var upState:§_-aS§ = new §_-aS§(new ClickButtonUp());
      
      private var §_-V28§:Timer;
      
      protected var §_-13n§:Boolean = false;
      
      public var enabled:Boolean = true;
      
      public var onScript:String = "";
      
      public var offScript:String = "";
      
      public var haxeScript:Boolean = false;
      
      private var §_-71D§:int = 0;
      
      private var §_-MQ§:int = 0;
      
      private var filter:BlurFilter = null;
      
      private var §_-31O§:BlurFilter = null;
      
      private var §_-l1m§:BlurFilter = null;
      
      private var button:Button;
      
      public function ClickButton()
      {
         this.§_-V28§ = new Timer(this.clickDelay,1);
         super();
         this.button = new Button(this.upState.texture,"",this.downState.texture);
         this.button.§_-i18§();
         this.§_-J2J§(this.button);
         this.button.addEventListener(TouchEvent.§_-qu§,this.§_-ll§);
         this.button.enabled = false;
         this.button.§_-d1g§.parent.alpha = 1;
         this.§_-71D§ = this.downState.width;
         this.§_-MQ§ = this.downState.height;
         this.toggle = false;
         this.size = this.size;
         this.fixed = true;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         this.rect = true;
         this.getStarlingView().touchable = true;
         this.getStarlingView().useHandCursor = true;
         this.touchable = true;
      }
      
      override public function set alpha(param1:Number) : void
      {
         super.alpha = param1;
         if(this.getStarlingView())
         {
            this.getStarlingView().touchable = true;
            this.getStarlingView().useHandCursor = true;
         }
         this.touchable = true;
      }
      
      private function §_-ll§(param1:TouchEvent) : void
      {
         var _loc2_:§_-J1a§ = param1.§_-d2S§(this.button);
         if(!_loc2_)
         {
            return;
         }
         this.§_-cf§ = !this.§_-V28§.running && this.enabled && Hero.§_-Cg§ && Hero.self.shaman;
         if(Boolean(_loc2_) && Boolean(_loc2_.§_-iR§ == §_-01Z§.§_-N1v§) && this.§_-cf§)
         {
            this.§_-t2M§();
         }
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(new b2BodyDef(false,false,b2Body.b2_dynamicBody));
         this.body.CreateFixture(new b2FixtureDef(b2PolygonShape.AsOrientedBox(this.size.x * 0.5 + 1,this.size.y * 0.5 + 1,new b2Vec2()),this,0,0,0.1,§_-CT§,§_-81p§,0));
         super.build(param1);
         this.world = param1;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.onScript,this.offScript,[this.size.x,this.size.y],this.enabled,this.toggle,this.clickDelay,this.haxeScript]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         var _loc2_:Array = param1[GameBody.§_-W1F§(param1) ? 3 : 1];
         this.onScript = _loc2_[0];
         this.offScript = _loc2_[1];
         this.size = new b2Vec2(_loc2_[2][0],_loc2_[2][1]);
         this.enabled = Boolean(_loc2_[3]);
         this.toggle = Boolean(_loc2_[4]);
         this.clickDelay = _loc2_[5];
         if(!(6 in _loc2_))
         {
            return;
         }
         this.haxeScript = Boolean(_loc2_[6]);
      }
      
      public function §_-43w§(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:Object = null;
         if(!(this.§_-21H§ is §_-vO§) || param2)
         {
            this.§_-21H§.scriptUtils.execute(param1,this,{},this.haxeScript ? §_-s1V§.HAXE_SCRIPT : §_-s1V§.LUA_SCRIPT);
            this.toggle = !this.toggle;
         }
         else
         {
            _loc3_ = {"ClickButton":[this.id]};
            Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify(_loc3_));
         }
      }
      
      public function endContact(param1:b2Contact) : void
      {
      }
      
      public function beginContact(param1:b2Contact) : void
      {
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         param1.SetEnabled(false);
      }
      
      public function postSolve(param1:b2Contact, param2:b2ContactImpulse) : void
      {
      }
      
      public function get size() : b2Vec2
      {
         return this.§_-y1d§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x = param1.y = Math.max(param1.x,param1.y);
         param1.x = Math.max(param1.x,0);
         param1.y = Math.max(param1.y,0);
         this.§_-y1d§ = param1;
         this.downState.scaleX = this.upState.scaleX = this.§_-y1d§.x * Game.§_-12A§ / this.§_-71D§;
         this.downState.scaleY = this.upState.scaleY = this.§_-y1d§.y * Game.§_-12A§ / this.§_-MQ§;
         this.button.upState = this.upState.texture;
         this.button.downState = this.downState.texture;
         this.button.width = this.§_-y1d§.x * Game.§_-12A§;
         this.button.height = this.§_-y1d§.y * Game.§_-12A§;
         this.button.§_-i18§();
      }
      
      public function get rect() : Boolean
      {
         return this.§_-13n§;
      }
      
      public function set rect(param1:Boolean) : void
      {
         this.§_-13n§ = param1;
      }
      
      public function get toggle() : Boolean
      {
         return this._toggle;
      }
      
      public function set toggle(param1:Boolean) : void
      {
         this._toggle = param1;
         this.button.state = param1 ? §_-s11§.DOWN : §_-s11§.UP;
      }
      
      public function get clickDelay() : int
      {
         return this.§_-c2R§;
      }
      
      public function set clickDelay(param1:int) : void
      {
         this.§_-c2R§ = param1;
         this.§_-V28§.delay = param1;
      }
      
      public function §_-u2W§() : Number
      {
         return 0.1 * (int(this.onScript != "") + int(this.offScript != ""));
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc3_:Array = null;
         super.update(param1);
         while(this.§_-018§.length > 0)
         {
            _loc3_ = this.§_-018§.shift();
            this.§_-43w§(_loc3_[0],Boolean(_loc3_[1]));
         }
         if(!this.§_-31O§)
         {
            this.§_-31O§ = BlurFilter.§_-J23§(16726579);
         }
         if(!this.§_-l1m§)
         {
            this.§_-l1m§ = BlurFilter.§_-J23§(13106865);
         }
         var _loc2_:BlurFilter = this.§_-cf§ ? this.§_-l1m§ : (this.§_-V28§.running ? this.§_-31O§ : null);
         if(Boolean(_loc2_) && this.filter != _loc2_)
         {
            this.filter = _loc2_;
            this.button.filter = this.filter;
         }
      }
      
      override public function dispose() : void
      {
         this.button.removeEventListener(TouchEvent.§_-qu§,this.§_-ll§);
         this.button.filter = null;
         this.button.dispose();
         if(this.§_-31O§)
         {
            this.§_-31O§.dispose();
         }
         if(this.§_-l1m§)
         {
            this.§_-l1m§.dispose();
         }
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
         this.world = null;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-CT§;
      }
      
      protected function §_-H1h§(param1:Boolean = false) : void
      {
         this.§_-uX§(this.toggle ? this.offScript : this.onScript,param1);
      }
      
      private function §_-uX§(param1:String, param2:Boolean = false) : void
      {
         this.§_-018§.push([param1,param2]);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if(!("ClickButton" in _loc2_))
         {
            return;
         }
         var _loc3_:Array = _loc2_["ClickButton"];
         if(_loc3_[0] != this.id)
         {
            return;
         }
         this.§_-H1h§(true);
      }
      
      private function §_-t2M§() : void
      {
         this.§_-H1h§();
         this.§_-V28§.reset();
         this.§_-V28§.start();
      }
   }
}

