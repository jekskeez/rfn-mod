package utils
{
   import Box2D.Collision.b2AABB;
   import Box2D.Common.Math.b2Math;
   import Box2D.Common.Math.b2Transform;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import flash.geom.Point;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-11I§
   {
      
      private static var §_-up§:Array;
      
      private static var §_-b10§:Class;
      
      public function §_-11I§()
      {
         super();
      }
      
      public static function §_-q1V§(param1:Point) : b2Vec2
      {
         return new b2Vec2(param1.x,param1.y);
      }
      
      public static function GetWorldPoint(param1:§_-xn§, param2:b2Vec2) : b2Vec2
      {
         var _loc3_:b2Transform = new b2Transform();
         _loc3_.R.Set(param1.angle);
         _loc3_.position.SetV(param1.position);
         return b2Math.MulX(_loc3_,param2);
      }
      
      public static function §_-016§(param1:b2World, param2:b2Vec2, param3:Class) : Array
      {
         if(!param1 || !param2 || !param3)
         {
            §_-p2U§.add("Error: findBodiesAtPoint:",param1,param2,param3);
            return [];
         }
         §_-11I§.§_-up§ = [];
         §_-11I§.§_-b10§ = param3;
         param1.QueryPoint(§_-G20§,param2);
         var _loc4_:Array = §_-11I§.§_-up§;
         §_-11I§.§_-up§ = null;
         §_-11I§.§_-b10§ = null;
         return _loc4_;
      }
      
      public static function §_-S2t§(param1:b2World, param2:b2AABB) : Array
      {
         var _loc5_:b2Fixture = null;
         var _loc3_:Array = [];
         var _loc4_:b2Body = param1.GetBodyList();
         while(_loc4_ != null)
         {
            _loc5_ = _loc4_.GetFixtureList();
            while(_loc5_ != null)
            {
               if(Boolean(_loc5_.GetAABB().Contains(param2)) || Boolean(_loc5_.GetAABB().TestOverlap(param2)))
               {
                  _loc3_.push(_loc4_);
               }
               _loc5_ = _loc5_.GetNext();
            }
            _loc4_ = _loc4_.GetNext();
         }
         return _loc3_;
      }
      
      public static function §_-oP§(param1:b2World, param2:Array, param3:int) : Array
      {
         var _loc5_:int = 0;
         var _loc9_:b2Body = null;
         var _loc10_:b2Fixture = null;
         var _loc4_:Array = [];
         var _loc6_:b2AABB = null;
         var _loc7_:b2AABB = null;
         var _loc8_:Boolean = false;
         while(param2.length)
         {
            _loc5_ = Math.random() * param2.length;
            _loc6_ = param2[_loc5_];
            _loc8_ = false;
            _loc9_ = param1.GetBodyList();
            while(_loc9_ != null)
            {
               _loc10_ = _loc9_.GetFixtureList();
               while(_loc10_ != null)
               {
                  _loc7_ = _loc10_.GetAABB();
                  if(Boolean(_loc7_.Contains(_loc6_)) || Boolean(_loc7_.TestOverlap(_loc6_)))
                  {
                     param2.splice(_loc5_,1);
                     _loc8_ = true;
                     break;
                  }
                  _loc10_ = _loc10_.GetNext();
               }
               if(_loc8_)
               {
                  break;
               }
               _loc9_ = _loc9_.GetNext();
            }
            if(!_loc8_)
            {
               _loc4_.push(_loc6_.upperBound);
               param2.splice(_loc5_,1);
               if(_loc4_.length == param3)
               {
                  return _loc4_;
               }
            }
         }
         return _loc4_;
      }
      
      private static function §_-G20§(param1:b2Fixture) : Boolean
      {
         var _loc2_:b2Body = param1.GetBody();
         if(_loc2_.GetUserData() is §_-11I§.§_-b10§)
         {
            §_-up§.push(_loc2_);
         }
         return true;
      }
   }
}

