package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-H1l§.§_-sC§;
   import §_-TK§.§_-aS§;
   import §_-WJ§.DetectHeroEvent;
   import §_-X2V§.HollowEvent;
   import §_-X2V§.SquirrelEvent;
   import §_-hd§.§_-01M§;
   import §_-j4§.§_-43y§;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.mainGame.entity.§_-41O§;
   import game.mainGame.entity.§_-O2M§;
   import sounds.GameSounds;
   import starling.display.Sprite;
   
   public class §_-i1V§ extends GameBody implements §_-41O§, §_-O2M§
   {
      
      private static const §_-F20§:int = 20;
      
      private static const §_-t2B§:int = 20;
      
      private static const §_-hh§:int = 53;
      
      private static const §_-uD§:int = 56;
      
      private static const §_-53X§:uint = 32;
      
      private static const §_-C3c§:uint = 8;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.2,0,0.1,§_-53X§,§_-C3c§,0,true);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(true,false,b2Body.b2_staticBody);
      
      private var icon:§_-aS§ = null;
      
      private var §_-S2I§:flash.display.Sprite = new NetIcon();
      
      private var §_-31G§:Point;
      
      private var scale:Number;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var §_-j2G§:Boolean = false;
      
      private var §_-b1J§:§_-43y§ = null;
      
      private var controller:§_-sC§ = null;
      
      private var squirrels:Array = [];
      
      private var image:MovieClip;
      
      public function §_-i1V§()
      {
         super();
         this.icon = new §_-aS§(this.§_-S2I§);
         this.image = new NetIcon();
         §_-J2J§(this.icon);
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
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         §_-ql§.shape = b2PolygonShape.AsOrientedBox(this._width * 0.5 / Game.§_-12A§,this._height * 0.5 / Game.§_-12A§,new b2Vec2(this._width * 0.5 / Game.§_-12A§,this._height * 0.5 / Game.§_-12A§));
         this.§_-b1J§ = new §_-43y§(this.body.CreateFixture(§_-ql§));
         this.§_-b1J§.addEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§,false,0,true);
         super.build(param1);
         this.controller = new §_-sC§();
         this.controller.§_-Ab§ = this.squirrels;
         param1.AddController(this.controller);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Hero = null;
         this.§_-S2I§ = null;
         this.image = null;
         if(this.controller)
         {
            this.controller.§_-Ab§ = null;
            this.controller.GetWorld().RemoveController(this.controller);
            this.controller = null;
         }
         super.dispose();
         this.removeFromParent();
         for each(_loc1_ in this.squirrels)
         {
            if(!(!_loc1_ || !_loc1_.§_-K13§))
            {
               this.§_-R12§(_loc1_);
            }
         }
         this.squirrels = null;
         if(this.§_-b1J§ == null)
         {
            return;
         }
         this.§_-b1J§.removeEventListener(DetectHeroEvent.§_-D1l§,this.§_-M2L§);
         this.§_-b1J§ = null;
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this._width,this._height,true]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
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
         Game.stage.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
      }
      
      public function get size() : b2Vec2
      {
         return new b2Vec2(this._width / 5,this._height / 5);
      }
      
      public function set size(param1:b2Vec2) : void
      {
         param1.x -= param1.x % (§_-hh§ / Game.§_-12A§);
         param1.y -= param1.y % (§_-uD§ / Game.§_-12A§);
         this.resize(param1.x * 5,param1.y * 5);
      }
      
      private function resize(param1:int, param2:int) : void
      {
         param1 = Math.max(§_-F20§,param1);
         param2 = Math.max(§_-t2B§,param2);
         this._width = param1;
         this._height = param2;
         this.draw();
      }
      
      private function draw() : void
      {
         this._width -= this._width % §_-hh§;
         this._height -= this._height % §_-uD§;
         this._width = Math.max(this._width,§_-hh§);
         this._height = Math.max(this._height,§_-uD§);
         if(§_-U2E§(this.icon))
         {
            removeChildStarling(this.icon);
         }
         while(numChildren > 0)
         {
            §_-av§(0);
         }
         var _loc1_:starling.display.Sprite = §_-01M§.§_-D1J§(this.image,this._width,this._height);
         §_-J2J§(_loc1_);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         if(this.§_-j2G§)
         {
            Game.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
            Game.stage.removeEventListener(MouseEvent.CLICK,this.§_-H1h§);
            return;
         }
         this.§_-j2G§ = true;
         Game.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
         this.§_-31G§ = new Point(param1.stageX,param1.stageY);
         this.resize(§_-F20§,§_-t2B§);
         if(§_-U2E§(this.icon))
         {
            removeChildStarling(this.icon);
         }
      }
      
      private function §_-Cv§(param1:MouseEvent) : void
      {
         this.resize((param1.stageX - this.§_-31G§.x) / this.scale,(param1.stageY - this.§_-31G§.y) / this.scale);
      }
      
      private function §_-M2L§(param1:DetectHeroEvent) : void
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
            _loc2_.addEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
            _loc2_.addEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
            _loc2_.addEventListener(SquirrelEvent.§_-f2P§,this.§_-A1R§);
            _loc2_.addEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
            if(_loc2_.id == Game.selfId)
            {
               GameSounds.play("stairs");
            }
         }
         else if(param1.state == DetectHeroEvent.END_CONTACT)
         {
            this.§_-R12§(_loc2_);
            if(_loc3_ != -1)
            {
               this.squirrels.splice(_loc3_,1);
            }
         }
      }
      
      private function §_-A1R§(param1:Event) : void
      {
         this.§_-R12§(param1["player"]);
         var _loc2_:int = this.squirrels.indexOf(param1["player"]);
         if(_loc2_ != -1)
         {
            this.squirrels.splice(_loc2_,1);
         }
      }
      
      private function §_-R12§(param1:Hero) : void
      {
         param1.climbing = false;
         param1.removeEventListener(SquirrelEvent.§_-pZ§,this.§_-A1R§);
         param1.removeEventListener(SquirrelEvent.§_-E25§,this.§_-A1R§);
         param1.removeEventListener(SquirrelEvent.§_-f2P§,this.§_-A1R§);
         param1.removeEventListener(HollowEvent.§_-h1g§,this.§_-A1R§);
      }
   }
}

