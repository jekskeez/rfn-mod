package §_-B1O§
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
   import §_-51g§.§_-22J§;
   import §_-83V§.GameBody;
   import §_-A2x§.§_-Ar§;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-RI§.§_-h2I§;
   import flash.utils.Timer;
   import game.mainGame.§_-W1B§;
   import game.mainGame.§_-s2a§;
   import game.mainGame.entity.§_-R2m§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import starling.display.Button;
   import starling.display.§_-Le§;
   import starling.filters.BlurFilter;
   
   public class ClickButton extends GameBody implements §_-22J§, §_-R2m§, §_-W1B§
   {
      
      private static const §_-L2Q§:int = 0;
      
      private static const §_-zX§:int = 0;
      
      private static const §_-T2h§:uint = 2;
      
      private var §_-s1Y§:b2Vec2 = new b2Vec2(§_-T2h§,§_-T2h§);
      
      private var world:b2World;
      
      private var §_-z1X§:Array = [];
      
      private var §_-hB§:Boolean = false;
      
      private var §_-h2h§:int = 2000;
      
      private var _toggle:Boolean;
      
      private var downState:§_-h2I§ = new §_-h2I§(new ClickButtonDown());
      
      private var upState:§_-h2I§ = new §_-h2I§(new ClickButtonUp());
      
      private var §_-Z2W§:Timer;
      
      protected var §_-C2l§:Boolean = false;
      
      public var enabled:Boolean = true;
      
      public var onScript:String = "";
      
      public var offScript:String = "";
      
      public var haxeScript:Boolean = false;
      
      private var §_-M1h§:int = 0;
      
      private var §_-lQ§:int = 0;
      
      private var filter:BlurFilter = null;
      
      private var §_-62j§:BlurFilter = null;
      
      private var §_-A3g§:BlurFilter = null;
      
      private var button:Button;
      
      public function ClickButton()
      {
         this.§_-Z2W§ = new Timer(this.clickDelay,1);
         super();
         this.button = new Button(this.upState.texture,"",this.downState.texture);
         this.button.§_-x2x§();
         this.§_-83v§(this.button);
         this.button.addEventListener(TouchEvent.§_-N1l§,this.§_-b26§);
         this.button.enabled = false;
         this.button.§_-t2U§.parent.alpha = 1;
         this.§_-M1h§ = this.downState.width;
         this.§_-lQ§ = this.downState.height;
         this.toggle = false;
         this.size = this.size;
         this.fixed = true;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
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
      
      private function §_-b26§(param1:TouchEvent) : void
      {
         var _loc2_:§_-e2m§ = param1.§_-H2o§(this.button);
         if(!_loc2_)
         {
            return;
         }
         this.§_-hB§ = !this.§_-Z2W§.running && this.enabled && Hero.§_-6g§ && Hero.self.shaman;
         if(Boolean(_loc2_) && Boolean(_loc2_.§_-Q2S§ == §_-sj§.§_-ML§) && this.§_-hB§)
         {
            this.§_-33E§();
         }
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(new b2BodyDef(false,false,b2Body.b2_dynamicBody));
         this.body.CreateFixture(new b2FixtureDef(b2PolygonShape.AsOrientedBox(this.size.x * 0.5 + 1,this.size.y * 0.5 + 1,new b2Vec2()),this,0,0,0.1,§_-L2Q§,§_-zX§,0));
         super.build(param1);
         this.world = param1;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.onScript,this.offScript,[this.size.x,this.size.y],this.enabled,this.toggle,this.clickDelay,this.haxeScript]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         var _loc2_:Array = param1[GameBody.§_-u1P§(param1) ? 3 : 1];
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
      
      public function §_-l1j§(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:Object = null;
         if(!(this.§_-H2D§ is §_-Ar§) || param2)
         {
            this.§_-H2D§.scriptUtils.execute(param1,this,{},this.haxeScript ? §_-s2a§.HAXE_SCRIPT : §_-s2a§.LUA_SCRIPT);
            this.toggle = !this.toggle;
         }
         else
         {
            _loc3_ = {"ClickButton":[this.id]};
            Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify(_loc3_));
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
         return this.§_-s1Y§;
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x = param1.y = Math.max(param1.x,param1.y);
         param1.x = Math.max(param1.x,0);
         param1.y = Math.max(param1.y,0);
         this.§_-s1Y§ = param1;
         this.downState.scaleX = this.upState.scaleX = this.§_-s1Y§.x * Game.§_-x2P§ / this.§_-M1h§;
         this.downState.scaleY = this.upState.scaleY = this.§_-s1Y§.y * Game.§_-x2P§ / this.§_-lQ§;
         this.button.upState = this.upState.texture;
         this.button.downState = this.downState.texture;
         this.button.width = this.§_-s1Y§.x * Game.§_-x2P§;
         this.button.height = this.§_-s1Y§.y * Game.§_-x2P§;
         this.button.§_-x2x§();
      }
      
      public function get rect() : Boolean
      {
         return this.§_-C2l§;
      }
      
      public function set rect(param1:Boolean) : void
      {
         this.§_-C2l§ = param1;
      }
      
      public function get toggle() : Boolean
      {
         return this._toggle;
      }
      
      public function set toggle(param1:Boolean) : void
      {
         this._toggle = param1;
         this.button.state = param1 ? §_-Le§.DOWN : §_-Le§.UP;
      }
      
      public function get clickDelay() : int
      {
         return this.§_-h2h§;
      }
      
      public function set clickDelay(param1:int) : void
      {
         this.§_-h2h§ = param1;
         this.§_-Z2W§.delay = param1;
      }
      
      public function §_-q§() : Number
      {
         return 0.1 * (int(this.onScript != "") + int(this.offScript != ""));
      }
      
      override public function update(param1:Number = 0) : void
      {
         var _loc3_:Array = null;
         super.update(param1);
         while(this.§_-z1X§.length > 0)
         {
            _loc3_ = this.§_-z1X§.shift();
            this.§_-l1j§(_loc3_[0],Boolean(_loc3_[1]));
         }
         if(!this.§_-62j§)
         {
            this.§_-62j§ = BlurFilter.§_-q2e§(16726579);
         }
         if(!this.§_-A3g§)
         {
            this.§_-A3g§ = BlurFilter.§_-q2e§(13106865);
         }
         var _loc2_:BlurFilter = this.§_-hB§ ? this.§_-A3g§ : (this.§_-Z2W§.running ? this.§_-62j§ : null);
         if(Boolean(_loc2_) && this.filter != _loc2_)
         {
            this.filter = _loc2_;
            this.button.filter = this.filter;
         }
      }
      
      override public function dispose() : void
      {
         this.button.removeEventListener(TouchEvent.§_-N1l§,this.§_-b26§);
         this.button.filter = null;
         this.button.dispose();
         if(this.§_-62j§)
         {
            this.§_-62j§.dispose();
         }
         if(this.§_-A3g§)
         {
            this.§_-A3g§.dispose();
         }
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
         this.world = null;
      }
      
      override protected function get categoriesBits() : uint
      {
         return §_-L2Q§;
      }
      
      protected function §_-P2v§(param1:Boolean = false) : void
      {
         this.§_-n1F§(this.toggle ? this.offScript : this.onScript,param1);
      }
      
      private function §_-n1F§(param1:String, param2:Boolean = false) : void
      {
         this.§_-z1X§.push([param1,param2]);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
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
         this.§_-P2v§(true);
      }
      
      private function §_-33E§() : void
      {
         this.§_-P2v§();
         this.§_-Z2W§.reset();
         this.§_-Z2W§.start();
      }
   }
}

