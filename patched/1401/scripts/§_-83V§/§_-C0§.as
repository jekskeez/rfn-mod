package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-51g§.§_-z12§;
   import §_-81N§.§_-W1J§;
   import §_-8I§.HollowEvent;
   import §_-8I§.SquirrelEvent;
   import §_-C1l§.§_-a2§;
   import §_-R1w§.DetectHeroEvent;
   import §_-RI§.§_-h2I§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.mainGame.entity.§_-E1U§;
   import game.mainGame.entity.§_-R2m§;
   import sounds.GameSounds;
   import starling.display.Sprite;
   
   public class §_-C0§ extends GameBody implements §_-R2m§, §_-E1U§
   {
      
      private static const §_-11C§:int = 20;
      
      private static const §_-62i§:int = 20;
      
      private static const §_-Y2T§:int = 53;
      
      private static const §_-J2Y§:int = 56;
      
      private static const §_-52X§:uint = 32;
      
      private static const §_-FN§:uint = 8;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.2,0,0.1,§_-52X§,§_-FN§,0,true);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      private var icon:§_-h2I§ = null;
      
      private var §_-I1M§:flash.display.Sprite = new NetIcon();
      
      private var §_-92m§:Point;
      
      private var scale:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var §_-b6§:Boolean = false;
      
      private var §_-V2K§:§_-z12§ = null;
      
      private var controller:§_-W1J§ = null;
      
      private var squirrels:Array = [];
      
      private var image:MovieClip;
      
      public function §_-C0§()
      {
         super();
         this.icon = new §_-h2I§(this.§_-I1M§);
         this.image = new NetIcon();
         §_-83v§(this.icon);
         this.fixed = true;
      }
      
      override public function set rotation(param1:Number) : void
      {
         if(!param1)
         {
         }
         super.rotation = 0;
      }
      
      override public function set angle(param1:Number) : void
      {
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         §_-03A§.shape = b2PolygonShape.AsOrientedBox(this._width * 0.5 / Game.§_-x2P§,this._height * 0.5 / Game.§_-x2P§,new b2Vec2(this._width * 0.5 / Game.§_-x2P§,this._height * 0.5 / Game.§_-x2P§));
         this.§_-V2K§ = new §_-z12§(this.body.CreateFixture(§_-03A§));
         this.§_-V2K§.addEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§,false,0,true);
         super.build(param1);
         this.controller = new §_-W1J§();
         this.controller.§_-i2a§ = this.squirrels;
         param1.AddController(this.controller);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Hero = null;
         this.§_-I1M§ = null;
         this.image = null;
         if(this.controller)
         {
            this.controller.§_-i2a§ = null;
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller = null;
         }
         super.dispose();
         this.removeFromParent();
         for each(_loc1_ in this.squirrels)
         {
            if(!(!_loc1_ || !_loc1_.§_-k2W§))
            {
               this.§_-k2j§(_loc1_);
            }
         }
         this.squirrels = null;
         if(this.§_-V2K§ == null)
         {
            return;
         }
         this.§_-V2K§.removeEventListener(DetectHeroEvent.§_-41O§,this.§_-5d§);
         this.§_-V2K§ = null;
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this._width,this._height,true]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         if((param1[1] as Array).length == 2)
         {
            param1[1][0] *= 64 / 60;
            param1[1][1] *= 64 / 60;
         }
         this.resize(param1[1][0],param1[1][1]);
         this.draw();
      }
      
      public function init(param1:Number) : void
      {
         this.scale = param1;
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
      }
      
      public function get size() : b2Vec2
      {
         return new b2Vec2(this._width / 5,this._height / 5);
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x -= param1.x % (§_-Y2T§ / Game.§_-x2P§);
         param1.y -= param1.y % (§_-J2Y§ / Game.§_-x2P§);
         this.resize(param1.x * 5,param1.y * 5);
      }
      
      private function resize(param1:int, param2:int) : void
      {
         param1 = Math.max(§_-11C§,param1);
         param2 = Math.max(§_-62i§,param2);
         this._width = param1;
         this._height = param2;
         this.draw();
      }
      
      private function draw() : void
      {
         this._width -= this._width % §_-Y2T§;
         this._height -= this._height % §_-J2Y§;
         this._width = Math.max(this._width,§_-Y2T§);
         this._height = Math.max(this._height,§_-J2Y§);
         if(§_-ws§(this.icon))
         {
            removeChildStarling(this.icon);
         }
         while(numChildren > 0)
         {
            §_-n2T§(0);
         }
         var _loc1_:starling.display.Sprite = §_-a2§.§_-A3m§(this.image,this._width,this._height);
         §_-83v§(_loc1_);
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         if(this.§_-b6§)
         {
            Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
            Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-P2v§);
            return;
         }
         this.§_-b6§ = true;
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
         this.§_-92m§ = new Point(param1.stageX,param1.stageY);
         this.resize(§_-11C§,§_-62i§);
         if(§_-ws§(this.icon))
         {
            removeChildStarling(this.icon);
         }
      }
      
      private function §_-D23§(param1:MouseEvent) : void
      {
         this.resize((param1.stageX - this.§_-92m§.x) / this.scale,(param1.stageY - this.§_-92m§.y) / this.scale);
      }
      
      private function §_-5d§(param1:DetectHeroEvent) : void
      {
         var _loc2_:Hero = param1.hero;
         if(_loc2_.inHollow)
         {
            return;
         }
         if(_loc2_.ghost)
         {
            return;
         }
         var _loc3_:int = this.squirrels.indexOf(_loc2_);
         if(param1.state == DetectHeroEvent.BEGIN_CONTACT && _loc3_ == -1)
         {
            this.squirrels.push(_loc2_);
            _loc2_.climbing = true;
            _loc2_.addEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
            _loc2_.addEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
            _loc2_.addEventListener(SquirrelEvent.§_-722§,this.§_-jf§);
            _loc2_.addEventListener(HollowEvent.§_-63s§,this.§_-jf§);
            if(_loc2_.id == Game.selfId)
            {
               GameSounds.play("stairs");
            }
         }
         else if(param1.state == DetectHeroEvent.END_CONTACT)
         {
            this.§_-k2j§(_loc2_);
            if(_loc3_ != -1)
            {
               this.squirrels.splice(_loc3_,1);
            }
         }
      }
      
      private function §_-jf§(param1:Event) : void
      {
         this.§_-k2j§(param1["player"]);
         var _loc2_:int = this.squirrels.indexOf(param1["player"]);
         if(_loc2_ != -1)
         {
            this.squirrels.splice(_loc2_,1);
         }
      }
      
      private function §_-k2j§(param1:Hero) : void
      {
         param1.climbing = false;
         param1.removeEventListener(SquirrelEvent.§_-f2m§,this.§_-jf§);
         param1.removeEventListener(SquirrelEvent.§_-z1B§,this.§_-jf§);
         param1.removeEventListener(SquirrelEvent.§_-722§,this.§_-jf§);
         param1.removeEventListener(HollowEvent.§_-63s§,this.§_-jf§);
      }
   }
}

