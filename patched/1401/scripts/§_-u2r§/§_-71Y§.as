package §_-u2r§
{
   import Box2D.Collision.Shapes.b2PolygonShape;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import Box2D.Dynamics.b2FixtureDef;
   import Box2D.Dynamics.b2World;
   import §_-33r§.§_-L2a§;
   import §_-33r§.§_-M2g§;
   import §_-33r§.§_-Ou§;
   import §_-33r§.§_-j1z§;
   import §_-33r§.§_-q1d§;
   import §_-83V§.GameBody;
   import §_-I10§.§_-g2W§;
   import §_-RI§.§_-d2d§;
   import §_-Rn§.§_-Q1E§;
   import flash.events.Event;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-71Y§ extends GameBody
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = 1;
      
      private static const §_-F2L§:uint = 2;
      
      public static const §_-61u§:int = 0;
      
      public static const §_-k1x§:int = 1;
      
      public static const §_-Ds§:int = 3;
      
      public static const §_-B2j§:int = 2;
      
      public static const §_-T1Q§:int = 4;
      
      public static const §_-n2x§:Number = 12;
      
      private static const §_-L1E§:b2PolygonShape = b2PolygonShape.AsOrientedBox(§_-F2L§,§_-F2L§,new b2Vec2());
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(§_-L1E§,null,0.8,0.1,1,§_-52X§,§_-FN§,0);
      
      private static const §_-E2n§:b2BodyDef = new b2BodyDef(false,false,b2Body.b2_dynamicBody);
      
      public static var types:Array = null;
      
      public var type:int = -1;
      
      protected var view:§_-d2d§ = null;
      
      protected var §_-p1H§:§_-d2d§ = null;
      
      public function §_-71Y§()
      {
         super();
         this.fixed = true;
      }
      
      override public function build(param1:b2World) : void
      {
         this.body = param1.CreateBody(§_-E2n§);
         this.body.SetUserData(this);
         this.body.CreateFixture(§_-03A§).SetUserData(this);
         super.build(param1);
         this.view = new §_-d2d§(new this.imageClass());
         this.view.x = -72;
         this.view.y = -133;
         this.view.addEventListener(Event.ENTER_FRAME,this.§_-r5§);
         this.view.play();
         §_-83v§(this.view);
      }
      
      protected function get imageClass() : Class
      {
         if(!types)
         {
            types = [BearPerkView0,BearPerkView1,BearPerkView2,BearPerkView3,BearPerkView4];
         }
         return types[this.type];
      }
      
      override public function dispose() : void
      {
         if(this.view)
         {
            this.view.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
         }
         this.view = null;
         super.dispose();
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.type,this.playerId]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.type = param1[1][0];
         this.playerId = param1[1][1];
      }
      
      protected function §_-r5§(param1:Event) : void
      {
         if(!this.view)
         {
            return;
         }
         if(this.view.currentFrame < this.view.totalFrames - 1)
         {
            return;
         }
         this.view.stop();
         this.view.removeEventListener(Event.ENTER_FRAME,this.§_-r5§);
         this.view.visible = false;
         this.§_-x17§();
      }
      
      private function §_-x17§() : void
      {
         var _loc3_:Hero = null;
         var _loc4_:b2Vec2 = null;
         var _loc5_:§_-Q1E§ = null;
         var _loc1_:Hero = this.§_-H2D§.squirrels.get(this.playerId);
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-H2D§.squirrels.players)
         {
            _loc4_ = _loc3_.position.Copy();
            _loc4_.Subtract(this.position);
            if(_loc4_.Length() > §_-n2x§ || _loc4_.Length() == 0 || _loc3_.id == this.playerId || _loc3_.isDead || _loc3_.inHollow)
            {
               continue;
            }
            _loc2_++;
            switch(this.type)
            {
               case §_-B2j§:
                  _loc5_ = new §_-Q1E§();
                  _loc5_.damping = 0.05;
                  _loc5_.frequency = 0.75;
                  _loc5_.body = this;
                  _loc5_.hero = _loc3_;
                  this.§_-H2D§.map.§_-nA§(_loc5_,true);
                  break;
               case §_-T1Q§:
                  _loc3_.behaviourController.§_-gz§(new §_-q1d§(15));
                  break;
               case §_-k1x§:
                  if(_loc3_.isSquirrel)
                  {
                     _loc3_.behaviourController.§_-gz§(new §_-L2a§(5,[§_-g2W§.§_-a1v§],true));
                  }
                  break;
               case §_-61u§:
                  _loc3_.behaviourController.§_-gz§(new §_-Ou§(10,0.15));
                  break;
               case §_-Ds§:
                  if(_loc3_.isSelf)
                  {
                     Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
                     _loc3_.§_-4j§(Hero.§_-517§);
                  }
            }
         }
         switch(this.type)
         {
            case §_-B2j§:
               this.§_-p1H§ = new §_-d2d§(new HunnyStart());
               §_-83v§(this.§_-p1H§);
               if(_loc1_)
               {
                  _loc1_.behaviourController.§_-gz§(new §_-j1z§(10,8));
               }
               break;
            case §_-T1Q§:
               if(_loc1_)
               {
                  _loc1_.behaviourController.§_-gz§(new §_-M2g§(15,0.2 + 0.03 * _loc2_));
               }
               break;
            case §_-k1x§:
               break;
            case §_-61u§:
               if(_loc1_)
               {
                  _loc1_.behaviourController.§_-gz§(new §_-Ou§(10,0.2 + 0.03 * _loc2_));
               }
               break;
            case §_-Ds§:
               if(Boolean(_loc1_) && _loc1_.isSelf)
               {
                  _loc1_.§_-4j§(Hero.§_-517§);
                  Connection.§_-Li§(§_-h2B§.§_-Aa§,§_-h2B§.§_-BW§);
               }
         }
      }
   }
}

