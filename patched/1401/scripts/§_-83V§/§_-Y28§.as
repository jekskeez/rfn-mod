package §_-83V§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-42p§.§_-01t§;
   import §_-RI§.§_-d2d§;
   import §_-Rj§.§_-A32§;
   import flash.events.Event;
   import game.mainGame.§_-V§;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   
   public class §_-Y28§ extends GameBody
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-b2L§:Number = 0.1;
      
      private static const §_-V2X§:Number = 0.5;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsVector(§_-b2Y§,0);
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.5,0.1,2,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-d2d§ = null;
      
      private var §_-c1w§:Boolean = false;
      
      private var water:§_-01t§ = null;
      
      private var §_-J15§:Number = 0;
      
      public var §_-i1u§:int = -1;
      
      private var §_-91m§:Number = 0;
      
      public var waterVolume:b2Vec2 = new b2Vec2(60,60);
      
      public var waterTime:Number = 5000;
      
      public function §_-Y28§()
      {
         super();
         this.view = new §_-d2d§(new HydrantImage());
         this.view.gotoAndStop(0);
         §_-83v§(this.view);
         this.fixed = true;
         this.view.addEventListener(Event.COMPLETE,this.§_-A2a§);
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
      }
      
      private static function get §_-b2Y§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-1,0));
         _loc1_.push(new b2Vec2(-1,-4.5));
         _loc1_.push(new b2Vec2(0,-5.5));
         _loc1_.push(new b2Vec2(1,-4.5));
         _loc1_.push(new b2Vec2(1,0));
         return _loc1_;
      }
      
      private function §_-A2a§(param1:Event) : void
      {
         if(this.§_-c1w§)
         {
            this.view.loop = true;
            this.view.§_-h23§ = 22;
            this.view.play();
         }
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
         this.body.CreateFixture(§_-03A§);
         super.build(param1);
      }
      
      override public function dispose() : void
      {
         this.view.removeEventListener(Event.COMPLETE,this.§_-A2a§);
         this.view = null;
         this.water = null;
         this.waterVolume = null;
         Connection.forget(this.§_-o2C§,[§_-S2I§.§_-b1y§]);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.active)
         {
            if(this.waterLayer >= this.waterVolume.y)
            {
               this.§_-91m§ -= param1 * 1000;
               if(this.§_-91m§ <= 0)
               {
                  this.active = false;
               }
            }
            else
            {
               this.waterLayer += §_-b2L§;
            }
         }
         else
         {
            this.waterLayer -= §_-V2X§;
         }
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         var _loc2_:Array = [this.active,[this.waterVolume.x,this.waterVolume.y],this.waterTime];
         if(this.water)
         {
            _loc2_.push([this.waterLayer,this.§_-91m§]);
         }
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.active = Boolean(param1[1][0]);
         this.waterVolume = new b2Vec2(param1[1][1][0],param1[1][1][1]);
         this.waterTime = param1[1][2];
         if(!(3 in param1[1]))
         {
            return;
         }
         this.§_-J15§ = param1[1][3][0];
         this.§_-91m§ = param1[1][3][1];
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-c1w§ == param1)
         {
            return;
         }
         this.§_-c1w§ = param1;
         if(!param1)
         {
            this.view.loop = false;
            this.view.§_-h23§ = 0;
            this.view.gotoAndStop(0);
         }
         else if(this.waterLayer == 0)
         {
            this.view.loop = false;
            this.view.§_-h23§ = 0;
            this.view.gotoAndPlay(1);
         }
         if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing) || !this.water || this.§_-H2D§ is §_-A32§)
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"waterLayer":[this.id,this.waterLayer]}));
      }
      
      public function get active() : Boolean
      {
         return this.§_-c1w§;
      }
      
      public function set §_-Oz§(param1:int) : void
      {
         this.§_-i1u§ = param1;
         if(!this.§_-H2D§)
         {
            return;
         }
         this.water = this.§_-H2D§.map.getObject(this.§_-Oz§) as §_-01t§;
         this.waterLayer = this.§_-J15§;
      }
      
      public function get §_-Oz§() : int
      {
         return this.§_-i1u§;
      }
      
      private function set waterLayer(param1:Number) : void
      {
         var _loc2_:§_-01t§ = null;
         if(this.§_-J15§ == param1)
         {
            return;
         }
         if(this.water == null && param1 >= 0 && this.§_-Oz§ == -1)
         {
            if(Boolean(this.§_-H2D§) && this.§_-H2D§.squirrels.isSynchronizing)
            {
               this.§_-i1u§ = -2;
               _loc2_ = new §_-01t§();
               _loc2_.size = new b2Vec2(this.waterVolume.x,param1);
               _loc2_.bubblingFactor = 0.1;
               _loc2_.color0 = _loc2_.color1 = _loc2_.color2 = 6750207;
               _loc2_.position = new b2Vec2(this.position.x - this.waterVolume.x / 4,this.position.y);
               _loc2_.waveEnabled = true;
               _loc2_.waveAmplitude = 5;
               _loc2_.waveLength = 5;
               _loc2_.§_-u29§ = this.id;
               this.§_-H2D§.map.§_-nA§(_loc2_,true);
            }
            return;
         }
         if(this.§_-Oz§ < 0)
         {
            return;
         }
         if(this.§_-J15§ < 0 && param1 < this.§_-J15§)
         {
            return;
         }
         this.§_-J15§ = param1;
         if(param1 < 0 && Boolean(this.water))
         {
            this.§_-e1Q§();
            return;
         }
         if(this.§_-J15§ >= this.waterVolume.y)
         {
            this.§_-91m§ = this.waterTime;
         }
         this.water.size = new b2Vec2(this.waterVolume.x,this.§_-J15§);
      }
      
      private function get waterLayer() : Number
      {
         return this.§_-J15§;
      }
      
      private function §_-e1Q§() : void
      {
         if(this.§_-H2D§ is §_-A32§)
         {
            this.§_-Y2F§(this.§_-Oz§);
            return;
         }
         if(!(this.§_-H2D§ && this.§_-H2D§.squirrels.isSynchronizing))
         {
            return;
         }
         Connection.§_-Li§(§_-h2B§.§_-b1y§,JSON.stringify({"destroyWater":[this.id,this.§_-Oz§]}));
         this.§_-i1u§ = -1;
      }
      
      private function §_-Y2F§(param1:int) : void
      {
         this.water = null;
         this.§_-J15§ = 0;
         this.§_-i1u§ = -1;
         if(!this.§_-H2D§)
         {
            return;
         }
         this.§_-H2D§.map.remove(this.§_-H2D§.map.getObject(param1),true);
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Object = param1[1];
         if("destroyWater" in _loc2_)
         {
            if(_loc2_["destroyWater"][0] != this.id)
            {
               return;
            }
            this.§_-Y2F§(_loc2_["destroyWater"][1]);
         }
         if("waterLayer" in _loc2_)
         {
            if(_loc2_["waterLayer"][0] != this.id)
            {
               return;
            }
            this.§_-J15§ = _loc2_["waterLayer"][1];
         }
      }
   }
}

