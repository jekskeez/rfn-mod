package §_-8Q§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-A3j§.§_-b1N§;
   import §_-TK§.§_-f1u§;
   import §_-l2u§.§_-62b§;
   import flash.events.Event;
   import game.mainGame.§_-q2c§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   
   public class §_-YZ§ extends GameBody
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-bo§:Number = 0.1;
      
      private static const §_-Qu§:Number = 0.5;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-G2l§:b2PolygonShape = b2PolygonShape.AsVector(§_-M1z§,0);
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(§_-G2l§,null,0.5,0.1,2,§_-53X§,§_-C3c§,0);
      
      private static const §_-41z§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      private var view:§_-f1u§ = null;
      
      private var §_-8x§:Boolean = false;
      
      private var water:§_-b1N§ = null;
      
      private var §_-kW§:Number = 0;
      
      public var §_-5e§:int = -1;
      
      private var §_-422§:Number = 0;
      
      public var waterVolume:b2Vec2 = new b2Vec2(60,60);
      
      public var waterTime:Number = 5000;
      
      public function §_-YZ§()
      {
         super();
         this.view = new §_-f1u§(new HydrantImage());
         this.view.gotoAndStop(0);
         §_-J2J§(this.view);
         this.fixed = true;
         this.view.addEventListener(Event.COMPLETE,this.§_-N1G§);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-1q§]);
      }
      
      private static function get §_-M1z§() : Vector.<b2Vec2>
      {
         var _loc1_:Vector.<b2Vec2> = new Vector.<b2Vec2>();
         _loc1_.push(new b2Vec2(-1,0));
         _loc1_.push(new b2Vec2(-1,-4.5));
         _loc1_.push(new b2Vec2(0,-5.5));
         _loc1_.push(new b2Vec2(1,-4.5));
         _loc1_.push(new b2Vec2(1,0));
         return _loc1_;
      }
      
      private function §_-N1G§(param1:Event) : void
      {
         if(this.§_-8x§)
         {
            this.view.loop = true;
            this.view.§_-i1w§ = 22;
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
         this.body = param1.CreateBody(§_-41z§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-ql§);
         super.build(param1);
      }
      
      override public function dispose() : void
      {
         this.view.removeEventListener(Event.COMPLETE,this.§_-N1G§);
         this.view = null;
         this.water = null;
         this.waterVolume = null;
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-1q§]);
         super.dispose();
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.active)
         {
            if(this.waterLayer >= this.waterVolume.y)
            {
               this.§_-422§ -= param1 * 1000;
               if(this.§_-422§ <= 0)
               {
                  this.active = false;
               }
            }
            else
            {
               this.waterLayer += §_-bo§;
            }
         }
         else
         {
            this.waterLayer -= §_-Qu§;
         }
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         var _loc2_:Array = [this.active,[this.waterVolume.x,this.waterVolume.y],this.waterTime];
         if(this.water)
         {
            _loc2_.push([this.waterLayer,this.§_-422§]);
         }
         _loc1_.push(_loc2_);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.active = Boolean(param1[1][0]);
         this.waterVolume = new b2Vec2(param1[1][1][0],param1[1][1][1]);
         this.waterTime = param1[1][2];
         if(!(3 in param1[1]))
         {
            return;
         }
         this.§_-kW§ = param1[1][3][0];
         this.§_-422§ = param1[1][3][1];
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-8x§ == param1)
         {
            return;
         }
         this.§_-8x§ = param1;
         if(!param1)
         {
            this.view.loop = false;
            this.view.§_-i1w§ = 0;
            this.view.gotoAndStop(0);
         }
         else if(this.waterLayer == 0)
         {
            this.view.loop = false;
            this.view.§_-i1w§ = 0;
            this.view.gotoAndPlay(1);
         }
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing) || !this.water || this.§_-21H§ is §_-62b§)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"waterLayer":[this.id,this.waterLayer]}));
      }
      
      public function get active() : Boolean
      {
         return this.§_-8x§;
      }
      
      public function set §_-C5§(param1:int) : void
      {
         this.§_-5e§ = param1;
         if(!this.§_-21H§)
         {
            return;
         }
         this.water = this.§_-21H§.map.getObject(this.§_-C5§) as §_-b1N§;
         this.waterLayer = this.§_-kW§;
      }
      
      public function get §_-C5§() : int
      {
         return this.§_-5e§;
      }
      
      private function set waterLayer(param1:Number) : void
      {
         var _loc2_:§_-b1N§ = null;
         if(this.§_-kW§ == param1)
         {
            return;
         }
         if(this.water == null && param1 >= 0 && this.§_-C5§ == -1)
         {
            if(Boolean(this.§_-21H§) && this.§_-21H§.squirrels.isSynchronizing)
            {
               this.§_-5e§ = -2;
               _loc2_ = new §_-b1N§();
               _loc2_.size = new b2Vec2(this.waterVolume.x,param1);
               _loc2_.bubblingFactor = 0.1;
               _loc2_.color0 = _loc2_.color1 = _loc2_.color2 = 6750207;
               _loc2_.position = new b2Vec2(this.position.x - this.waterVolume.x / 4,this.position.y);
               _loc2_.waveEnabled = true;
               _loc2_.waveAmplitude = 5;
               _loc2_.waveLength = 5;
               _loc2_.§_-b2l§ = this.id;
               this.§_-21H§.map.§_-TP§(_loc2_,true);
            }
            return;
         }
         if(this.§_-C5§ < 0)
         {
            return;
         }
         if(this.§_-kW§ < 0 && param1 < this.§_-kW§)
         {
            return;
         }
         this.§_-kW§ = param1;
         if(param1 < 0 && Boolean(this.water))
         {
            this.§_-EQ§();
            return;
         }
         if(this.§_-kW§ >= this.waterVolume.y)
         {
            this.§_-422§ = this.waterTime;
         }
         this.water.size = new b2Vec2(this.waterVolume.x,this.§_-kW§);
      }
      
      private function get waterLayer() : Number
      {
         return this.§_-kW§;
      }
      
      private function §_-EQ§() : void
      {
         if(this.§_-21H§ is §_-62b§)
         {
            this.§_-N2Z§(this.§_-C5§);
            return;
         }
         if(!(this.§_-21H§ && this.§_-21H§.squirrels.isSynchronizing))
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-1q§,JSON.stringify({"destroyWater":[this.id,this.§_-C5§]}));
         this.§_-5e§ = -1;
      }
      
      private function §_-N2Z§(param1:int) : void
      {
         this.water = null;
         this.§_-kW§ = 0;
         this.§_-5e§ = -1;
         if(!this.§_-21H§)
         {
            return;
         }
         this.§_-21H§.map.remove(this.§_-21H§.map.getObject(param1),true);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Object = param1[1];
         if("destroyWater" in _loc2_)
         {
            if(_loc2_["destroyWater"][0] != this.id)
            {
               return;
            }
            this.§_-N2Z§(_loc2_["destroyWater"][1]);
         }
         if("waterLayer" in _loc2_)
         {
            if(_loc2_["waterLayer"][0] != this.id)
            {
               return;
            }
            this.§_-kW§ = _loc2_["waterLayer"][1];
         }
      }
   }
}

